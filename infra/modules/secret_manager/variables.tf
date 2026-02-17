variable "project_id" {
  description = "GCP project id"
  type        = string
}

variable "secret_id" {
  description = "Secret id"
  type        = string
}

variable "secret_value" {
  description = "Optional initial secret value"
  type        = string
  default     = null
  sensitive   = true
}