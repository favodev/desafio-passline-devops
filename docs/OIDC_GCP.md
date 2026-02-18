# OIDC (Workload Identity Federation) para GitHub Actions -> GCP

Este documento describe cómo habilitar federación de identidad (sin llaves estáticas) para que GitHub Actions publique artefactos e imágenes en GCP.

## Objetivo

Evitar credenciales JSON de larga vida y autenticar CI/CD con tokens OIDC temporales.

## Prerrequisitos

- Proyecto GCP real (ej: `my-gcp-project`).
- `gcloud` autenticado con permisos de IAM admin.
- Repositorio GitHub: `favodev/desafio-passline-devops`.

## 1) Habilitar APIs en GCP

```bash
gcloud services enable \
  iam.googleapis.com \
  iamcredentials.googleapis.com \
  sts.googleapis.com \
  artifactregistry.googleapis.com \
  run.googleapis.com \
  --project <PROJECT_ID>
```

## 2) Crear Workload Identity Pool y Provider

```bash
gcloud iam workload-identity-pools create github-pool \
  --project=<PROJECT_ID> \
  --location=global \
  --display-name="GitHub Actions Pool"

gcloud iam workload-identity-pools providers create-oidc github-provider \
  --project=<PROJECT_ID> \
  --location=global \
  --workload-identity-pool=github-pool \
  --display-name="GitHub OIDC Provider" \
  --issuer-uri="https://token.actions.githubusercontent.com" \
  --attribute-mapping="google.subject=assertion.sub,attribute.repository=assertion.repository,attribute.ref=assertion.ref"
```

## 3) Crear Service Account para CI/CD

```bash
gcloud iam service-accounts create gh-actions-deployer \
  --project=<PROJECT_ID> \
  --display-name="GitHub Actions Deployer"
```

Asignar permisos mínimos (ajustar según alcance):

```bash
gcloud projects add-iam-policy-binding <PROJECT_ID> \
  --member="serviceAccount:gh-actions-deployer@<PROJECT_ID>.iam.gserviceaccount.com" \
  --role="roles/artifactregistry.writer"

gcloud projects add-iam-policy-binding <PROJECT_ID> \
  --member="serviceAccount:gh-actions-deployer@<PROJECT_ID>.iam.gserviceaccount.com" \
  --role="roles/run.admin"

gcloud projects add-iam-policy-binding <PROJECT_ID> \
  --member="serviceAccount:gh-actions-deployer@<PROJECT_ID>.iam.gserviceaccount.com" \
  --role="roles/iam.serviceAccountUser"
```

## 4) Permitir que GitHub repo asuma la Service Account

```bash
gcloud iam service-accounts add-iam-policy-binding \
  gh-actions-deployer@<PROJECT_ID>.iam.gserviceaccount.com \
  --project=<PROJECT_ID> \
  --role="roles/iam.workloadIdentityUser" \
  --member="principalSet://iam.googleapis.com/projects/<PROJECT_NUMBER>/locations/global/workloadIdentityPools/github-pool/attribute.repository/favodev/desafio-passline-devops"
```

## 5) Configurar Secrets en GitHub

En el repo, crear estos secrets:

- `GCP_WIF_PROVIDER`: `projects/<PROJECT_NUMBER>/locations/global/workloadIdentityPools/github-pool/providers/github-provider`
- `GCP_SERVICE_ACCOUNT`: `gh-actions-deployer@<PROJECT_ID>.iam.gserviceaccount.com`
- `GCP_PROJECT_ID`: `<PROJECT_ID>`
- `GCP_REGION`: por ejemplo `us-central1`

## 6) Validar ejecución

1. Merge a `main` para disparar `promote-dev`.
2. Crear y pushear un tag `v*` para disparar `promote-prod`.
3. Verificar en logs que no aparezca "documentation mode".

## Seguridad recomendada

- Limitar acceso por branch (`attribute.ref`) en el provider.
- Usar environments protegidos (`dev`/`prod`) con approvals.
- Rotar/reducir roles al mínimo necesario.
