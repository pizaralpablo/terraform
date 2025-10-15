terraform {
  required_version = ">= 1.3.0"
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.27"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.13"
    }
  }
}

module "helm_app" {
  source = "./modules/helm-app"

  release_name = var.release_name
  namespace    = var.namespace
  chart_path   = "./charts/${var.chart_name}"

  image_repository = var.image_repository
  image_tag        = var.image_tag
  replicas         = var.replicas

  resources_limits_cpu      = var.resources_limits_cpu
  resources_limits_memory   = var.resources_limits_memory
  resources_requests_cpu    = var.resources_requests_cpu
  resources_requests_memory = var.resources_requests_memory

  service_type = var.service_type
  service_port = var.service_port
}
