provider "google" {
  project = var.project_id
  region  = var.region
}

locals {
  app_name = "book-api-prod"
}

module "artifact_registry" {
  source = "../../modules/artifact_registry"

  project_id    = var.project_id
  region        = var.region
  repository_id = "book-api-prod"
  description   = "Docker images for prod"
}

module "runtime_service_account" {
  source = "../../modules/service_account"

  project_id   = var.project_id
  account_id   = "book-api-prod-sa"
  display_name = "Book API Prod Runtime SA"
  roles = [
    "roles/run.invoker",
    "roles/secretmanager.secretAccessor"
  ]
}

module "db_url_secret" {
  source = "../../modules/secret_manager"

  project_id = var.project_id
  secret_id  = "book-api-prod-db-url"
}

module "cloud_run" {
  source = "../../modules/cloud_run"

  project_id            = var.project_id
  region                = var.region
  service_name          = local.app_name
  image                 = var.image
  service_account_email = module.runtime_service_account.email
  allow_unauthenticated = false
  env_vars = {
    APP_ENV = "prod"
  }
}