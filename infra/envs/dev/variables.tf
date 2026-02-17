variable "project_id" {
  description = "GCP project id"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

variable "image" {
  description = "Container image to deploy"
  type        = string
  default     = "us-central1-docker.pkg.dev/example/book-api-dev/book-api:latest"
}