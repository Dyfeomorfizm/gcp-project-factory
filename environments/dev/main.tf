terraform {
    required_version = ">= 1.61.0"
    required_providers {
        google = {
            source  = "hashicorp/google"
            version = "6.15.0"
        }
        random = {
            source  = "hashicorp/random"
            version = "3.6.3"
        }
    }
}

provider "google" {
    region = var.default_region
}

module "gcp_dev_project" {
    source         = "../../modules/gcp_project"
    project_name   = "My Development"
    project_prefix = "my-dev"
    billing_account_id = var.billing_account_id
}