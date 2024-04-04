variable "owner" {
  description = "Owner of the resources"
  type        = string
}

variable "name_prefix" {
  description = "Common prefix to use for generating names"
  type    = string
}

variable "aws_region" {
  description = "AWS region to deploy to"
  type        = string
  default     = "us-west-2"
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

variable "vpc_cidr_block" {
  description = "CIDR block to use for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr_blocks" {
  description = "CIDR blocks to use for public subnets"
  type        = list(string)
  default = [
    "10.0.101.0/24",
    "10.0.102.0/24",
    "10.0.103.0/24"
  ]
}

variable "subnet_availability_zones" {
  description = "Availability zones to create subnets in"
  type        = list(string)
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
