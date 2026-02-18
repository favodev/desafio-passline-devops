# Registro de Uso de IA

Este documento deja evidencia del apoyo de IA utilizado durante la prueba.

## Principios aplicados
- La IA se usa como asistente, no como reemplazo del criterio técnico.
- Todo contenido sugerido por IA se revisa y ajusta manualmente.
- No se aceptan cambios sin validación local y lectura completa.

## Bitácora

| Fecha | Tarea | Uso de IA | Ajuste manual realizado | Resultado |
|------|------|-----------|--------------------------|-----------|
| 2026-02-17 | Cierre de etapa inicial de documentación | Estructura propuesta para README/CONTRIBUTING/SUBMISSION/AI_USAGE | Reescritura en tono propio, ajuste al estado real del repo y eliminación de supuestos no implementados | Aprobado y versionado |
| 2026-02-17 | Auditoría de consistencia de documentación | Revisión cruzada de rutas, etapas y claims de ejecución | Decisiones finales, priorización y redacción final realizadas manualmente; se limitaron cambios a ajustes documentales | Aprobado y versionado |
| 2026-02-17 | Base CI (PR + main) | Apoyo para estructurar workflow inicial y test smoke mínimo | Implementación y ajustes finales realizados manualmente (selección de checks, alcance de test y compatibilidad local/CI) | Aprobado y versionado |
| 2026-02-17 | Skeleton Terraform GCP (dev/prod) | Soporte para estructura repetitiva de módulos y stacks por ambiente | Definición de alcance, naming, priorización MVP y validación de consistencia realizadas manualmente | Aprobado y versionado |
| 2026-02-17 | Bloque deploy/rollback + Kubernetes MVP | Apoyo para acelerar generación de estructura base de runbooks, manifiestos y scripts repetitivos | Ajuste manual de alcance, priorización, validación local (docker/smoke) y redacción final de evidencias | Aprobado y versionado |
| 2026-02-17 | Auditoría final contra PDF (5 bloques + entregables) | Revisión asistida para identificar brechas finales y sincronizar documentación de estado | Confirmación manual de cobertura por requerimiento y edición final de `SUBMISSION.md`, `README.md` y `FEATURES.md` | Aprobado y versionado |
| 2026-02-17 | Cierre de brecha CI/CD por ambientes | Sugerencias para estructurar jobs `promote-dev` y `promote-prod` en GitHub Actions | Implementación final, condiciones de seguridad, naming y decisión de alcance (modo documentado sin secrets) resueltas manualmente | Aprobado y versionado |

## Validación humana
- Se verificó que la documentación refleje solo lo que existe en el repositorio.
- Se dejó explícito qué está completado y qué sigue pendiente.
- Se evitó lenguaje de “todo listo” donde todavía faltan implementaciones.

## Alcance no delegado a IA
- Decisiones finales de arquitectura y prioridades de implementación.
- Criterios de aceptación por etapa.
- Verificación de coherencia antes de publicar el repositorio.
- Definición final de estrategia de ramas/PR y plan de ejecución por etapas.
