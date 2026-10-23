terraform {
    required_version = ">= 1.5.0"
    required_providers {
        google = {
            source  = "hashicorp/google"
            version = "~> 5.0"
        }
        random = {
            source  = "hashicorp/random"
            version = "~> 3.5"
        }
    }
}

provider "google" {
    region = var.default_region
}

module "gcp_dev_project" {
    source         = "./modules/gcp_project"
    project_name   = "My Development"
    project_prefix = "my-dev"
    billing_account_id = var.billing_account_id
}

module "gcp_prod_project" {
    source         = "./modules/gcp_project"
    project_name   = "My Development"
    project_prefix = "my-prod"
    billing_account_id = var.billing_account_id
}