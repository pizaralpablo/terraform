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
    })
  ]

  lifecycle {
    create_before_destroy = true
  }
}

