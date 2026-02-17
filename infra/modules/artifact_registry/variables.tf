variable "project_id" {
  description = "GCP project id"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
}

variable "repository_id" {
  description = "Artifact Registry repository name"
  type        = string
}

variable "description" {
  description = "Repository description"
  type        = string
  default     = "Docker images repository"
}