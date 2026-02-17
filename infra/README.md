# Infra (Terraform - GCP)

Este directorio contiene un skeleton de IaC para la prueba técnica con separación por ambientes.

## Estructura

- `envs/dev`: stack de desarrollo
- `envs/prod`: stack de producción
- `modules/artifact_registry`: repositorio Docker
- `modules/service_account`: service account + bindings IAM mínimos
- `modules/secret_manager`: secretos base por ambiente
- `modules/cloud_run`: servicio de despliegue principal

## Requisitos

- Terraform >= 1.6
- Proyecto GCP con APIs habilitadas
- Autenticación con `gcloud auth application-default login` o credenciales equivalentes

## Flujo sugerido

```bash
cd infra/envs/dev
terraform init
terraform fmt -recursive
terraform validate
terraform plan -var="project_id=your-project-id"
```

Para `prod`, usar el mismo flujo en `infra/envs/prod`.

## Notas

- No se incluyen credenciales en el repositorio.
- El backend remoto en GCS queda documentado para una etapa posterior.