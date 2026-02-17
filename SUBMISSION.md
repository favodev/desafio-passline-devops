# Submission - Prueba Técnica DevOps (Passline)

Este archivo resume el estado real de avance de la prueba y cómo reproducir lo implementado.

## Datos generales
- Repositorio público: `https://github.com/favodev/desafio-passline-devops`
- Fecha de corte: 2026-02-17
- Estado actual: Etapa inicial cerrada

## Avance por etapas

### Etapa 1 - Base del repositorio y trazabilidad
- [x] Repositorio clonado y base de trabajo inicializada.
- [x] Estructura principal creada: `docs/`, `infra/`, `infra/envs/`, `infra/modules/`, `k8s/`.
- [x] Documentación inicial preparada (`README`, `CONTRIBUTING`, `SUBMISSION`, `AI_USAGE`).
- [x] Variables de entorno de ejemplo disponibles (`.env.example`).
- [x] Configuración inicial de contenedores (`Dockerfile`, `docker-compose.yml`).

### Etapa 2 - CI (pendiente)
- [ ] Pipeline de validación (lint/test/build).
- [ ] Reglas de merge con checks obligatorios.

### Etapa 3 - IaC en GCP/Terraform (pendiente)
- [ ] Definir módulos y entornos (`dev`/`prod`).
- [ ] Plan de estado remoto y convenciones de variables.

### Etapa 4 - Deploy/Kubernetes (pendiente)
- [ ] Manifiestos base de app + servicio + ingress.
- [ ] Estrategia de despliegue y rollback documentada.

## Cómo validar el estado actual
1. Clonar repositorio.
2. Crear `.env` desde `.env.example`.
3. Validar configuración de contenedores con `docker compose config`.
4. Revisar estructura de carpetas y documentación principal.
5. (Opcional, cuando exista `server/`) ejecutar `docker compose up --build`.

## Notas importantes
- Esta entrega prioriza trazabilidad de proceso desde el inicio (commits pequeños y documentación por etapa).
- Se evita marcar como terminado cualquier punto que todavía no tenga evidencia técnica en el repositorio.
- `Dockerfile` y `docker-compose.yml` están incluidos como base, pero la ejecución completa depende de tener el código de aplicación (`server/`) en este repositorio.

## Próximo hito recomendado
Levantar la primera versión de CI (al menos lint/build) para dejar cerrada la siguiente etapa de la prueba.