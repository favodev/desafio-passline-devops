variable "project_id" {
  description = "GCP project id"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
}

variable "service_name" {
  description = "Cloud Run service name"
  type        = string
}

variable "image" {
  description = "Container image URL"
  type        = string
}

variable "service_account_email" {
  description = "Service account email used by Cloud Run"
  type        = string
}

variable "allow_unauthenticated" {
  description = "Expose service publicly"
  type        = bool
  default     = true
}

variable "env_vars" {
  description = "Environment variables map"
  type        = map(string)
  default     = {}
}