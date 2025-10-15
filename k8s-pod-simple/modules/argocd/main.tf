resource "helm_release" "argocd" {
  name       = var.release_name
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = var.chart_version
  namespace  = var.namespace

  create_namespace = true

  values = [
    yamlencode({
      # Global configuration
      global = {
        domain = var.domain
      }

      # Server configuration
      server = {
        service = {
          type = var.server_service_type
        }
        ingress = {
          enabled = var.ingress_enabled
          hosts   = var.ingress_hosts
        }
        resources = {
          limits = {
            cpu    = var.server_cpu_limit
            memory = var.server_memory_limit
          }
          requests = {
            cpu    = var.server_cpu_request
            memory = var.server_memory_request
          }
        }
        extraArgs = var.server_insecure ? ["--insecure"] : []
      }

      # Controller configuration
      controller = {
        resources = {
          limits = {
            cpu    = var.controller_cpu_limit
            memory = var.controller_memory_limit
          }
          requests = {
            cpu    = var.controller_cpu_request
            memory = var.controller_memory_request
          }
        }
      }

      # Repo server configuration
      repoServer = {
        resources = {
          limits = {
            cpu    = var.repo_server_cpu_limit
            memory = var.repo_server_memory_limit
          }
          requests = {
            cpu    = var.repo_server_cpu_request
            memory = var.repo_server_memory_request
          }
        }
      }

      # Redis configuration
      redis = {
        enabled = var.redis_enabled
        resources = {
          limits = {
            cpu    = var.redis_cpu_limit
            memory = var.redis_memory_limit
          }
          requests = {
            cpu    = var.redis_cpu_request
            memory = var.redis_memory_request
          }
        }
      }

      # Additional configurations
      configs = {
        params = {
          "server.insecure" = var.server_insecure
        }
      }
    })
  ]

  lifecycle {
    create_before_destroy = true
  }
}


