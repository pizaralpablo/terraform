resource "helm_release" "app" {
  name       = var.release_name
  namespace  = var.namespace
  repository = null
  chart      = var.chart_path
  version    = null

  create_namespace = true

  values = [
    yamlencode({
      name = var.release_name
      image = {
        repository = var.image_repository
        tag         = var.image_tag
      }
      replicaCount = var.replicas
      resources = {
        limits = {
          cpu    = var.resources_limits_cpu
          memory = var.resources_limits_memory
        }
        requests = {
          cpu    = var.resources_requests_cpu
          memory = var.resources_requests_memory
        }
      }
      service = {
        type = var.service_type
        port = var.service_port
      }
      # Configuración para métricas
      serviceMonitor = {
        enabled = var.service_monitor_enabled
        interval = var.metrics_interval
        scrapeTimeout = var.metrics_scrape_timeout
        labels = var.service_monitor_labels
      }
    })
  ]

  lifecycle {
    create_before_destroy = true
  }
}

# ServiceMonitor para Prometheus
resource "kubernetes_manifest" "service_monitor" {
  count = var.service_monitor_enabled ? 1 : 0
  
  depends_on = [var.prometheus_dependency]
  
  manifest = {
    apiVersion = "monitoring.coreos.com/v1"
    kind       = "ServiceMonitor"
    metadata = {
      name      = "${var.release_name}-monitor"
      namespace = var.namespace
      labels    = var.service_monitor_labels
    }
    spec = {
      selector = {
        matchLabels = {
          app = var.release_name
        }
      }
      endpoints = [{
        port     = "http"
        interval = var.metrics_interval
        path     = var.metrics_path
      }]
    }
  }
}
