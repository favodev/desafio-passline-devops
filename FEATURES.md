# Features / Roadmap

Este archivo resume funcionalidades y entregables planificados para la prueba técnica.

## Estado actual

### Completado (etapa inicial)
- Estructura base del repositorio para `docs`, `infra`, `k8s`.
- Documentación mínima de trabajo (`README`, `CONTRIBUTING`, `SUBMISSION`, `AI_USAGE`).
- Base de contenedorización inicial con `Dockerfile` y `docker-compose.yml`.

### Completado (etapas siguientes)
- CI base en GitHub Actions para PR y `main` (`lint`, `test`, `docker build`).
- Skeleton Terraform GCP con separación `dev`/`prod` y módulos reutilizables.
- Arquitectura GCP documentada en `docs/ARCHITECTURE_GCP.md`.

### En progreso
- Documentación de deploy/rollback por ambientes.
- Manifiestos Kubernetes MVP y runbook GKE.

### Pendiente
- CD por ambientes (PR/main/tag) con flujo de promoción.
- Flujo de release con tags y GitHub Releases.

## Criterio de avance
Una funcionalidad se marca como completada solo cuando:

1. Tiene evidencia en el repositorio.
2. Está documentada en `SUBMISSION.md`.
3. Se puede reproducir localmente o mediante pipeline.
