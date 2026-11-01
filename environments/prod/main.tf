terraform {
    required_version = ">= 1.5.0"
    required_providers {
        google = {
            source  = "hashicorp/google"
            version = "~> 6.0"
        }
        random = {
            source  = "hashicorp/random"
            version = "~> 3.6"
        }
    }
}

provider "google" {
    region = var.default_region
}

module "gcp_prod_project" {
    source         = "../../modules/gcp_project"
    project_name   = "My Production"
    project_prefix = "my-prod"
    billing_account_id = var.billing_account_id
}