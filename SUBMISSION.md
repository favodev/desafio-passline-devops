# Submission - Prueba Técnica DevOps (Passline)

Este archivo resume el estado real de la entrega contra los 5 bloques del enunciado y los entregables finales.

## Datos generales
- Repositorio público: `https://github.com/favodev/desafio-passline-devops`
- Fecha de corte: 2026-02-17
- Estado global: **MVP avanzado** (bloques 1, 2, 3 y 5 cubiertos; bloque 4 parcial)

## Cobertura contra el enunciado (5 bloques)

### 1) Repo hygiene + versionamiento + flujo
- [x] Estrategia de ramas + PR flow definida en `CONTRIBUTING.md` y `docs/RELEASE_PROCESS.md`.
- [x] Checks ejecutándose antes de merge en `main` (workflow CI).
- [ ] Tags/releases trazables creados en remoto (pendiente cierre final).

### 2) CI (PR + main)
- [x] Workflow en `.github/workflows/ci.yml` para `pull_request` y `push` a `main`.
- [x] Lint/format (`black --check`), tests (`pytest`) y build Docker.
- [x] Validación Terraform en PR (`terraform fmt -check` + `terraform validate` en `dev` y `prod`).
- [ ] Completar links explícitos a runs de CI (PR y main) en esta sección.

### 3) Infraestructura en GCP con Terraform (IaC)
- [x] Estructura `infra/` con `envs/dev`, `envs/prod` y `modules/`.
- [x] Módulos mínimos implementados: Artifact Registry, Service Account + IAM, Secret Manager, Cloud Run.
- [x] Documento de arquitectura en `docs/ARCHITECTURE_GCP.md`.
- [x] Separación por ambientes con variables y outputs.
- [ ] Backend remoto Terraform (recomendado) quedó documentado, no implementado.

### 4) Orquestación de deploy (pipeline) + CD por ambientes
- [x] `docs/DEPLOYMENT.md` y `docs/ROLLBACK.md` con pasos concretos.
- [x] Smoke test mínimo sobre `/health` (`scripts/smoke_test.ps1` y `scripts/smoke_test.sh`).
- [x] Ambientes `dev` y `prod` modelados en Terraform.
- [x] Workflow de CD implementado en `.github/workflows/ci.yml`:
	- `main` promueve a `dev`.
	- `tag v*` promueve a `prod`.
- [ ] Falta evidencia de ejecución real con credenciales GCP (actualmente corre en modo documentado si faltan secrets).

### 5) Kubernetes en GCP (GKE) - alcance MVP
- [x] Manifiestos en `k8s/`: app, db (dev), service, configmap, secret example.
- [x] Probes/health checks configurados en `k8s/app-deployment.yaml`.
- [x] Runbook de operación en `docs/GKE_RUNBOOK.md`.
- [x] Opción elegida: manifests + runbook (sin cluster GKE real desplegado).

## Entregables finales (checklist)

- [x] Link del repo.
	- `https://github.com/favodev/desafio-passline-devops`
- [ ] Links a runs de CI (PR y main).
	- PR run: `PENDIENTE_AGREGAR_URL`
	- Main run: `PENDIENTE_AGREGAR_URL`
- [ ] Link a al menos un tag/release.
	- Tag/Release: `PENDIENTE_CREAR_Y_AGREGAR_URL`
- [ ] Evidencia de artefacto publicado y dónde verlo.
	- Artifact Registry (o equivalente): `PENDIENTE_AGREGAR_EVIDENCIA`
- [x] Resumen 5-10 líneas de decisiones principales + siguientes pasos.
- [x] Evidencia equivalente al despliegue real en GCP.
	- Se entrega IaC completo + runbooks + manifests + smoke reproducible localmente.

## Decisiones principales (resumen ejecutivo)
1. Se priorizó trazabilidad end-to-end (PR pequeños, commits convencionales y documentación por etapa).
2. Se cubrió primero la base verificable: CI con lint/test/build y validación local con Docker.
3. Se modeló IaC en Terraform con separación `dev`/`prod` y módulos reutilizables para escalar.
4. Se eligió Cloud Run como target principal de despliegue por simplicidad y time-to-value del MVP.
5. Para Kubernetes, se implementó opción MVP de manifests + runbook GKE con probes y rollback operativo.
6. Se evitó subir secretos; se usaron ejemplos y documentación de parametrización por ambiente.
7. Queda como siguiente hito publicar evidencia real de release/tag + artefacto y ejecutar promoción con secrets GCP.

## Cómo validar localmente
1. Crear `.env` desde `.env.example`.
2. Ejecutar `docker compose up --build`.
3. Verificar salud con `scripts/smoke_test.ps1` (Windows) o `scripts/smoke_test.sh` (Linux/macOS).
4. Validar Terraform en cada ambiente:
	 - `cd infra/envs/dev && terraform init && terraform fmt -recursive && terraform validate`
	 - `cd infra/envs/prod && terraform init && terraform fmt -recursive && terraform validate`