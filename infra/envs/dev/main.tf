provider "google" {
  project = var.project_id
  region  = var.region
}

locals {
  app_name = "book-api-dev"
}

module "artifact_registry" {
  source = "../../modules/artifact_registry"

  project_id    = var.project_id
  region        = var.region
  repository_id = "book-api-dev"
  description   = "Docker images for dev"
}

module "runtime_service_account" {
  source = "../../modules/service_account"

  project_id   = var.project_id
  account_id   = "book-api-dev-sa"
  display_name = "Book API Dev Runtime SA"
  roles = [
    "roles/run.invoker",
    "roles/secretmanager.secretAccessor"
  ]
}

module "db_url_secret" {
  source = "../../modules/secret_manager"

  project_id = var.project_id
  secret_id  = "book-api-dev-db-url"
}

module "cloud_run" {
  source = "../../modules/cloud_run"

  project_id            = var.project_id
  region                = var.region
  service_name          = local.app_name
  image                 = var.image
  service_account_email = module.runtime_service_account.email
  allow_unauthenticated = true
  env_vars = {
    APP_ENV = "dev"
  }
}