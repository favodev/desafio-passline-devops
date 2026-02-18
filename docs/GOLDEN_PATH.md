# Propuesta de estandarización para 20 servicios (Golden Path)

Propuesta breve para escalar este enfoque a múltiples microservicios con bajo costo operativo.

## Objetivo

Estandarizar CI/CD + IaC + seguridad para 20 servicios con mínima variación y alta trazabilidad.

## Diseño propuesto

## 1) Plantilla base de repositorio

Crear un template repo con:

- `.github/workflows/ci.yml` estandarizado (lint/test/build/scan/deploy).
- `infra/` por ambientes (`dev`/`prod`) reutilizando módulos comunes.
- `docs/` mínimos obligatorios (`DEPLOYMENT`, `ROLLBACK`, `SUBMISSION`, `AI_USAGE`).
- `scripts/` de smoke test consistentes.

## 2) Módulos Terraform compartidos

Mantener módulos versionados para:

- Artifact Registry
- Service Account + IAM
- Secret Manager
- Cloud Run / GKE base

Estrategia: cada servicio define solo variables; no duplica lógica.

## 3) Pipeline reusable en GitHub Actions

- Reusable workflow central (`workflow_call`) para CI/CD común.
- Inputs por servicio: runtime, ruta Dockerfile, nombre imagen, ruta terraform.
- Environments `dev`/`prod` con approvals y reglas de protección.

## 4) Seguridad por defecto

- OIDC obligatorio (sin llaves estáticas).
- Scans de dependencias e imagen en PR/main.
- Policy mínima IAM y secretos fuera del repo.

## 5) Gobernanza

- Convención única de ramas y SemVer.
- Checklist de PR obligatorio.
- Release notes con plantilla común.
- Métricas mínimas: lead time, tasa de fallos por deploy, MTTR.

## Fases recomendadas

1. **Fase 1 (3-5 servicios):** pilotear template + reusable workflow.
2. **Fase 2 (6-12):** migración por lotes y hardening de seguridad.
3. **Fase 3 (13-20):** adopción total + reporte centralizado de métricas.

## Resultado esperado

- Menos variabilidad entre servicios.
- Menor costo de mantenimiento del pipeline.
- Onboarding más rápido para nuevos equipos.
