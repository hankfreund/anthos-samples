terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">=3.17.0"
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

provider "azurerm" {
  features {}
}

provider "google" {
  project = var.gcp_project_id
}
