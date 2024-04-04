locals {
  temp_dir = var.temp_dir == "" ? "${path.root}/.tmp" : var.temp_dir
  helm_chart_name = "attached-bootstrap"
  module_install_dir = "${var.gcp_location}-${var.platform_version}"
  helm_chart_dir  = "${local.temp_dir}/${local.module_install_dir}/bootstrap_helm_chart"
}

# Get the install manifest from the attached clusters service.
data "google_container_attached_install_manifest" "boostrap" {
  location         = var.gcp_location
  project          = var.attached_cluster_fleet_project
  cluster_id       = var.attached_cluster_name
  platform_version = var.platform_version
}

# Write out the helm chart index.
resource "local_file" "bootstrap_helm_chart" {
  filename = "${local.helm_chart_dir}/Chart.yaml"
  content  = <<-EOT
    apiVersion: v2
    name: ${local.helm_chart_name}
    version: 0.0.0
    type: application
    EOT
}

# Write out the install manifest as the helm chart.
resource "local_file" "bootstrap_manifests" {
  filename = "${local.helm_chart_dir}/templates/bootstrap.yaml"
  content  = data.google_container_attached_install_manifest.boostrap.manifest
}

# Apply the helm chart to the cluster.
resource "helm_release" "local" {
  name       = local.helm_chart_name
  chart      = local.helm_chart_dir
  depends_on = [local_file.bootstrap_helm_chart, local_file.bootstrap_manifests]
}