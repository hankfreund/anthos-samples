variable "owner" {
  description = "Owner of the resources"
  type        = string
}

variable "name_prefix" {
  description = "Common prefix to use for generating names"
  type    = string
}

variable "azure_region" {
  description = "Azure region to deploy to"
  type        = string
  default     = "East US"
}

variable "tags" {
  description = "List of tags to apply to resources"
  type        = map(string)
  default     = {}
}

variable "k8s_version" {
  description = "Kubernetes version of the AKS cluster"
  type        = string
  default     = "1.28"
}

variable "node_count" {
  description = "The number of nodes in the default node pool"
  type        = number
  default     = 1
}

variable "gcp_project_id" {
  description = "The GCP project id where the cluster will be registered"
  type        = string
}

variable "gcp_location" {
  description = "GCP location to create the attached resource in"
  type        = string
  default     = "us-west1"
}

variable "platform_version" {
  description = "Platform version of the attached cluster resource"
  type        = string
  default     = "1.28.0-gke.3"
}
