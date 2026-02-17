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

Estado actual:
- Se agregó workflow base de CI en `.github/workflows/ci.yml` para PR y `main`.
- El workflow ejecuta `black --check`, `pytest` y `docker build`.
- Falta registrar links de runs (PR y main) para cerrar esta etapa.

### Etapa 3 - IaC en GCP/Terraform (pendiente)
- [x] Definir módulos y entornos (`dev`/`prod`).
- [ ] Plan de estado remoto y convenciones de variables.

Estado actual:
- Se creó skeleton Terraform en `infra/modules` para Artifact Registry, Service Account/IAM, Secret Manager y Cloud Run.
- Se crearon stacks por ambiente en `infra/envs/dev` y `infra/envs/prod`.
- Se agregó documentación de arquitectura en `docs/ARCHITECTURE_GCP.md`.

### Etapa 4 - Deploy/Kubernetes (pendiente)
- [ ] Manifiestos base de app + servicio + ingress.
- [ ] Estrategia de despliegue y rollback documentada.

## Cómo validar el estado actual
1. Clonar repositorio.
2. Crear `.env` desde `.env.example`.
3. Validar configuración de contenedores con `docker compose config`.
4. Revisar estructura de carpetas y documentación principal.
5. Ejecutar `docker compose up --build`.

## Notas importantes
- Esta entrega prioriza trazabilidad de proceso desde el inicio (commits pequeños y documentación por etapa).
- Se evita marcar como terminado cualquier punto que todavía no tenga evidencia técnica en el repositorio.
- El código base de aplicación (`server/`) se integró desde el repositorio público indicado en la prueba para mantener trazabilidad sobre una base funcional.

## Próximo hito recomendado
Completar CD por ambientes (PR/main/tag), generar `docs/DEPLOYMENT.md` + `docs/ROLLBACK.md`, y preparar manifiestos en `k8s/` + `docs/GKE_RUNBOOK.md`.