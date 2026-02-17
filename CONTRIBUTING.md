# Guía de Contribución

Este repositorio se usa para una prueba técnica DevOps. El objetivo es mantener cambios pequeños, trazables y fáciles de revisar.

## Flujo de ramas
- `main`: rama estable de entrega.
- `feat/*`: nuevas capacidades.
- `fix/*`: correcciones.
- `docs/*`: documentación.
- `chore/*`: tareas de mantenimiento.

Ejemplos:
- `feat/docker-healthcheck`
- `docs/submission-initial-stage`

## Convención de commits
Se usa formato tipo Conventional Commits:

- `feat: ...`
- `fix: ...`
- `docs: ...`
- `chore: ...`
- `refactor: ...`

Ejemplos:
- `docs: define initial challenge submission checklist`
- `feat: add base terraform env structure`

## Checklist antes de push
- Variables de entorno desde `.env.example`.
- Validación de `docker-compose.yml` con `docker compose config`.
- Contenedores levantan sin errores graves (`docker compose up --build`).
- Cambios documentados si impactan operación o despliegue.
- `SUBMISSION.md` actualizado cuando se cierre una tarea relevante.
- `AI_USAGE.md` actualizado si hubo apoyo de IA.

## Pull Requests
Cada PR debe incluir:

1. Objetivo claro (qué problema resuelve).
2. Alcance (qué archivos toca).
3. Evidencia mínima (comando, salida o captura).
4. Riesgos o pendientes.

Plantilla sugerida de descripción:

```md
## Objetivo

## Cambios realizados

## Validación

## Riesgos / Pendientes
```

## Seguridad
No subir secretos reales ni credenciales. Usar placeholders y variables de entorno.

## Licencia
Ver [LICENSE](LICENSE).
