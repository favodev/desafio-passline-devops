# Submission - Prueba Técnica DevOps (Passline)

Este archivo resume el estado real de la entrega contra los 5 bloques del enunciado y los entregables finales.

## Datos generales
- Repositorio público: `https://github.com/favodev/desafio-passline-devops`
- Fecha de corte: 2026-02-17
- Estado global: **MVP avanzado** (bloques 1, 2, 3, 4 y 5 cubiertos en alcance de prueba)

## Cobertura contra el enunciado (5 bloques)

### 1) Repo hygiene + versionamiento + flujo
- [x] Estrategia de ramas + PR flow definida en `CONTRIBUTING.md` y `docs/RELEASE_PROCESS.md`.
- [x] Checks ejecutándose antes de merge en `main` (workflow CI).
- [x] Tag trazable creado en remoto (`v0.1.0`).
- [ ] GitHub Release publicada (opcionalmente sobre `v0.1.0`).

### 2) CI (PR + main)
- [x] Workflow en `.github/workflows/ci.yml` para `pull_request` y `push` a `main`.
- [x] Lint/format (`black --check`), tests (`pytest`) y build Docker.
- [x] Validación Terraform en PR (`terraform fmt -check` + `terraform validate` en `dev` y `prod`).
- [x] Links explícitos a runs de CI (PR y main) documentados.

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
- [x] Evidencia de ejecución del pipeline en `main` y en `tag` registrada en runs de Actions.
- [ ] Ejecución real contra GCP queda opcional/no bloqueante para esta entrega (sin secrets productivos).

### 5) Kubernetes en GCP (GKE) - alcance MVP
- [x] Manifiestos en `k8s/`: app, db (dev), service, configmap, secret example.
- [x] Probes/health checks configurados en `k8s/app-deployment.yaml`.
- [x] Runbook de operación en `docs/GKE_RUNBOOK.md`.
- [x] Opción elegida: manifests + runbook (sin cluster GKE real desplegado).

## Entregables finales (checklist)

- [x] Link del repo.
	- `https://github.com/favodev/desafio-passline-devops`
- [x] Links a runs de CI (PR y main).
	- PR run (success): `https://github.com/favodev/desafio-passline-devops/actions/runs/22121552415`
	- Main run (success): `https://github.com/favodev/desafio-passline-devops/actions/runs/22121744969`
- [x] Link a al menos un tag/release.
	- Tag: `https://github.com/favodev/desafio-passline-devops/tree/v0.1.0`
	- Release (si se publica): `PENDIENTE_AGREGAR_URL_RELEASE`
- [x] Evidencia de artefacto publicado y dónde verlo.
	- Artefacto de pipeline (`build-metadata-*`) publicado en GitHub Actions Artifacts.
	- Run con publicación de artefacto: `https://github.com/favodev/desafio-passline-devops/actions/runs/22121744969`
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
7. Siguiente mejora sugerida: habilitar secrets/OIDC de GCP para promoción real a Artifact Registry + Cloud Run sin modo documentado.

## Cómo validar localmente
1. Crear `.env` desde `.env.example`.
2. Ejecutar `docker compose up --build`.
3. Verificar salud con `scripts/smoke_test.ps1` (Windows) o `scripts/smoke_test.sh` (Linux/macOS).
4. Validar Terraform en cada ambiente:
	 - `cd infra/envs/dev && terraform init && terraform fmt -recursive && terraform validate`
	 - `cd infra/envs/prod && terraform init && terraform fmt -recursive && terraform validate`