terraform {
  required_providers {
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