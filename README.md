# Desafío Técnico DevOps - Passline

Repositorio de trabajo para resolver la prueba técnica de DevOps / Platform Engineer.

## Objetivo
Preparar una entrega trazable, reproducible y pública, cubriendo:

- base de aplicación containerizada,
- estructura de infraestructura como código,
- manifiestos Kubernetes,
- documentación de despliegue y operación.

## Estado actual (etapa inicial)
Esta etapa se enfoca en dejar la base ordenada y auditable:

- estructura del repositorio creada (`docs`, `infra`, `infra/envs`, `infra/modules`, `k8s`),
- lineamientos de contribución/documentación definidos,
- archivos de entrega iniciales listos para revisión,
- base de contenedorización definida (`Dockerfile` + `docker-compose`) para el siguiente paso técnico.

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
Estado actual de esta etapa: se valida la base de contenedorización. La ejecución end-to-end de la app queda sujeta a tener sincronizado el código fuente de `server/` en este repositorio.

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

3. (Cuando `server/` esté presente) construir y levantar:
```bash
docker compose up --build
```

4. Bajar servicios:
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

