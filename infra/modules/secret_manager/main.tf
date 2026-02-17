resource "google_secret_manager_secret" "this" {
  project   = var.project_id
  secret_id = var.secret_id

  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "initial" {
  count = var.secret_value == null ? 0 : 1

  secret      = google_secret_manager_secret.this.id
  secret_data = var.secret_value
}