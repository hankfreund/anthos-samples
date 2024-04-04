#  :TODO: Support for proxy config

variable "temp_dir" {
  description = "Directory name to temporarily write out the helm chart for bootstrapping the attach process"
  type        = string
  default     = ""
}

variable "gcp_location" {
  description = "GCP location to create the attached resource in"
  type        = string
  default     = "us-west1"
}

variable "platform_version" {
  description = "Platform version of the attached cluster resource"
  type        = string
  default     = "1.28.8-gke.3"
}

variable "attached_cluster_fleet_project" {
  description = "GCP fleet project ID where the cluster will be attached"
  type        = string
}

variable "attached_cluster_name" {
  description = "Name for the attached cluster resource"
  type        = string
}