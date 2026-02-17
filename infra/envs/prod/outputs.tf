output "cloud_run_url" {
  value = module.cloud_run.service_uri
}

output "artifact_registry_repo" {
  value = module.artifact_registry.repository_name
}