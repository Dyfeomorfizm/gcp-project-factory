variable "project_name" {
  type = string
}

variable "project_prefix" {
  type = string
}

variable "billing_account_id" {
  type = string
}

variable "activate_apis" {
  type    = list(string)
  default = [
    "run.googleapis.com",
    "artifact_registry.googleapis.com",
    "secretmanager.googleapis.com",
    "iam.googleapis.com"
  ]
}