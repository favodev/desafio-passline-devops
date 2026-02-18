# Deployment Runbook (dev/prod)

Este documento describe cómo promover la aplicación por ambientes con un flujo práctico para la prueba.

## Estrategia de promoción

- `PR -> main`: validación y build
- `main`: imagen candidata para `dev`
- `tag/release`: promoción de imagen a `prod`

Implementación actual en pipeline:
- Archivo: `.github/workflows/ci.yml`
- PR a `main`: lint + tests + docker build + terraform fmt/validate
- Push a `main`: job `promote-dev`
- Push de tag `v*`: job `promote-prod`

## Prerrequisitos

- Docker disponible localmente
- Terraform instalado
- (Opcional) gcloud autenticado para ejecución real en GCP

## Flujo por ambiente

### 1) Validación en PR

Objetivo: validar que los cambios sean desplegables.

Pasos:
1. Ejecutar CI en PR (`lint`, `test`, `docker build`).
2. Ejecutar `terraform fmt` y `terraform validate` para el ambiente objetivo.

### 2) Promoción a dev

Con pipeline actual:
1. Al mergear a `main`, se ejecuta `promote-dev`.
2. Si existen secrets GCP (`GCP_WIF_PROVIDER`, `GCP_SERVICE_ACCOUNT`, `GCP_PROJECT_ID`, `GCP_REGION`), publica imagen en Artifact Registry.
3. Si faltan secrets, deja evidencia en `job summary` (modo documentado).

Opción documentada (sin GCP real):
1. Confirmar CI verde en `main`.
2. Definir imagen de dev en `infra/envs/dev/terraform.tfvars`.
3. Ejecutar `terraform plan` en `infra/envs/dev`.

Opción real (si hay proyecto GCP):
1. Publicar imagen en Artifact Registry (dev).
2. Ejecutar `terraform apply` en `infra/envs/dev`.
3. Verificar endpoint `/health`.

### 3) Promoción a prod (por tag)

1. Crear tag de release (ej: `v0.1.0`).
2. El push del tag ejecuta `promote-prod`.
3. Si hay secrets GCP, publica imagen versionada en Artifact Registry (repo prod).
4. Ejecutar `terraform plan`/`apply` en `infra/envs/prod` (manual approval recomendado).
5. Ejecutar smoke test post-deploy.

## Comandos de referencia

```bash
# dev
cd infra/envs/dev
terraform init
terraform fmt
terraform validate
terraform plan

# prod
cd ../prod
terraform init
terraform fmt
terraform validate
terraform plan
```

## Verificación post-deploy

- Estado del servicio: activo
- Endpoint de salud responde `200`: `/health`
- Logs sin errores críticos de arranque
