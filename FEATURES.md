# Features / Roadmap

Este archivo resume funcionalidades y entregables planificados para la prueba técnica.

## Estado actual

### Completado (etapa inicial)
- Estructura base del repositorio para `docs`, `infra`, `k8s`.
- Documentación mínima de trabajo (`README`, `CONTRIBUTING`, `SUBMISSION`, `AI_USAGE`).
- Base de contenedorización inicial con `Dockerfile` y `docker-compose.yml`.

### En progreso
- Definición del flujo de ramas + PR para cambios técnicos.
- Preparación de base CI en GitHub Actions.

### Pendiente
- Pipeline CI (lint, test, build).
- Base Terraform por ambientes (`infra/envs/dev` y `infra/envs/prod`).
- Primer set de manifiestos Kubernetes para despliegue.
- Flujo de release con tags y GitHub Releases.

## Criterio de avance
Una funcionalidad se marca como completada solo cuando:

1. Tiene evidencia en el repositorio.
2. Está documentada en `SUBMISSION.md`.
3. Se puede reproducir localmente o mediante pipeline.
