# Desafío Técnico DevOps - Passline

Repositorio de trabajo para resolver la prueba técnica de DevOps / Platform Engineer.

## Objetivo
Preparar una entrega trazable, reproducible y pública, cubriendo:

- base de aplicación containerizada,
- estructura de infraestructura como código,
- manifiestos Kubernetes,
- documentación de despliegue y operación.

## Estado de entrega
El repositorio se entrega con los bloques del challenge implementados en alcance MVP:

- flujo de trabajo y trazabilidad documentados (`CONTRIBUTING.md`, `docs/RELEASE_PROCESS.md`),
- CI/CD en GitHub Actions para PR/main/tag,
- IaC Terraform en GCP con separación `dev`/`prod` y módulos reutilizables,
- runbooks de despliegue/rollback y smoke tests sobre `/health`,
- manifiestos Kubernetes MVP + runbook GKE,
- release publicado `v0.1.0`.

## Estructura del repositorio
- `docs/`: documentación operativa y proceso de releases.
- `infra/`: infraestructura (Terraform) por ambientes y módulos.
- `infra/envs/`: definición por ambiente (`dev`, `prod`).
- `infra/modules/`: módulos reutilizables de Terraform.
- `k8s/`: manifiestos Kubernetes.
- `SUBMISSION.md`: bitácora de avance contra los requerimientos de la prueba.
- `AI_USAGE.md`: registro transparente del uso de IA.

## Requisitos
- Docker + Docker Compose
- Git

## Levantar entorno local (base)
1. Crear archivo de variables de entorno:

PowerShell:
```powershell
Copy-Item .env.example .env
```

Linux/macOS:
```bash
cp .env.example .env
```

2. Validar definición de servicios Docker:
```bash
docker compose config
```

3. Construir y levantar:
```bash
docker compose up --build
```

4. Verificar aplicación:
```bash
curl http://localhost:8000/health
```

PowerShell (alternativa):
```powershell
./scripts/smoke_test.ps1
```

5. Bajar servicios:
```bash
docker compose down
```

## Flujo de trabajo
- Rama principal: `main`
- Desarrollo: ramas cortas por objetivo (`feat/*`, `docs/*`, `fix/*`)
- Commits pequeños y descriptivos
- PR con checklist mínima antes de merge

Más detalle en [CONTRIBUTING.md](CONTRIBUTING.md).

## Evidencias
La evidencia de avance y estado por etapa se registra en [SUBMISSION.md](SUBMISSION.md).

## Licencia
Este repositorio mantiene la licencia del proyecto base. Ver [LICENSE](LICENSE).

