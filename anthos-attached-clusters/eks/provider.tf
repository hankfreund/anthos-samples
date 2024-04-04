terraform {
  required_providers {
   aws = {
      source  = "hashicorp/aws"
      version = ">=4.5.0"
    }
    google = {
      source = "hashicorp/google"
      version = ">=5.0.0"
    }
    helm = {
      source  = "hashicorp/helm"
    }
  }
  required_version = ">= 0.13"
}

provider "aws" {
  region = var.aws_region
  default_tags {
    tags = local.tags
  }
}

provider "google" {
  project = var.gcp_project_id
}
