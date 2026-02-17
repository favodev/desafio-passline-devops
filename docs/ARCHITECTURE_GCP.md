# Arquitectura GCP (MVP)

Esta arquitectura propone un flujo mínimo y trazable para la prueba técnica, orientado a despliegue en Cloud Run con IaC en Terraform.

```mermaid
flowchart LR
    GH[GitHub Repo]\n(PR + main)
    CI[GitHub Actions CI/CD]
    AR[Artifact Registry]
    CR[Cloud Run\n(dev/prod)]
    SM[Secret Manager]
    SA[Service Account + IAM]

    GH --> CI
    CI --> AR
    CI --> CR
    SA --> CR
    SM --> CR
```

## Componentes principales

- **Artifact Registry**: almacenamiento de imágenes Docker por ambiente.
- **Service Account + IAM**: permisos mínimos para runtime/deploy.
- **Secret Manager**: secretos por ambiente sin hardcode en repositorio.
- **Cloud Run**: objetivo principal de despliegue para API.
- **GitHub Actions**: orquestador de CI/CD para PR, main y releases.

## Separación por ambientes

- `infra/envs/dev`
- `infra/envs/prod`

Cada ambiente define su imagen, naming y configuración específica.