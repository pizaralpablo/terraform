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

  # ServiceMonitor configuration
  service_monitor_enabled = var.service_monitor_enabled
  metrics_interval        = var.metrics_interval
  metrics_scrape_timeout  = var.metrics_scrape_timeout
  metrics_path            = var.metrics_path
  prometheus_dependency   = module.prometheus
}

module "prometheus" {
  source = "./modules/prometheus"

  release_name  = var.prometheus_release_name
  namespace     = var.prometheus_namespace
  chart_version = var.prometheus_chart_version

  # Prometheus configuration
  retention     = var.prometheus_retention
  storage_class = var.prometheus_storage_class
  storage_size  = var.prometheus_storage_size

  # Grafana configuration
  grafana_enabled      = var.grafana_enabled
  grafana_password     = var.grafana_password
  grafana_service_type = var.grafana_service_type

  # AlertManager configuration
  alertmanager_enabled = var.alertmanager_enabled

  # Exporters
  node_exporter_enabled      = var.node_exporter_enabled
  kube_state_metrics_enabled = var.kube_state_metrics_enabled
}

module "argocd" {
  source = "./modules/argocd"

  release_name  = var.argocd_release_name
  namespace     = var.argocd_namespace
  chart_version = var.argocd_chart_version

  # Server configuration
  server_service_type = var.argocd_server_service_type
  server_insecure     = var.argocd_server_insecure

  # Ingress configuration
  ingress_enabled = var.argocd_ingress_enabled
}
