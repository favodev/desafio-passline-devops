variable "project_id" {
  description = "GCP project id"
  type        = string
}

variable "account_id" {
  description = "Service account id"
  type        = string
}

variable "display_name" {
  description = "Service account display name"
  type        = string
  default     = "Cloud Run deployer"
}

variable "roles" {
  description = "Project roles to assign"
  type        = list(string)
  default     = []
}