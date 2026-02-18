# Features / Roadmap

Este archivo resume funcionalidades y entregables planificados para la prueba técnica.

## Estado actual

### Completado
- Estructura base del repositorio para `docs`, `infra`, `k8s`.
- Documentación base (`README`, `CONTRIBUTING`, `SUBMISSION`, `AI_USAGE`).
- CI base en GitHub Actions para PR y `main` (`lint`, `test`, `docker build`).
- Base de aplicación backend integrada y validada con smoke test/health check.
- Skeleton Terraform GCP con separación `dev`/`prod` y módulos reutilizables.
- Arquitectura GCP documentada en `docs/ARCHITECTURE_GCP.md`.
- Runbooks `docs/DEPLOYMENT.md` y `docs/ROLLBACK.md`.
- Manifiestos Kubernetes MVP en `k8s/` + `docs/GKE_RUNBOOK.md`.
- Smoke test mínimo (`scripts/smoke_test.ps1` y `scripts/smoke_test.sh`).
- Release `v0.1.0` publicado en GitHub.
- Opcionales completados: OIDC documentado, security scan, propuesta golden path.

### Pendiente
- Despliegue real en GCP con credenciales OIDC configuradas en entornos `dev` y `prod`.
- Backend remoto Terraform en GCS (mejora recomendada).

## Criterio de avance
Una funcionalidad se marca como completada solo cuando:

1. Tiene evidencia en el repositorio.
2. Está documentada en `SUBMISSION.md`.
3. Se puede reproducir localmente o mediante pipeline.
