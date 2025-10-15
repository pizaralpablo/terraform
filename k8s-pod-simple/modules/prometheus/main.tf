resource "helm_release" "prometheus" {
  name       = var.release_name
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  version    = var.chart_version
  namespace  = var.namespace

  create_namespace = true

  values = [
    yamlencode({
      # Configuración de Prometheus
      prometheus = {
        prometheusSpec = {
          retention = var.retention
          resources = {
            limits = {
              cpu    = var.prometheus_cpu_limit
              memory = var.prometheus_memory_limit
            }
            requests = {
              cpu    = var.prometheus_cpu_request
              memory = var.prometheus_memory_request
            }
          }
          storageSpec = {
            volumeClaimTemplate = {
              spec = {
                storageClassName = var.storage_class
                accessModes      = ["ReadWriteOnce"]
                resources = {
                  requests = {
                    storage = var.storage_size
                  }
                }
              }
            }
          }
        }
      }

      # Configuración de Grafana
      grafana = {
        enabled = var.grafana_enabled
        adminPassword = var.grafana_password
        service = {
          type = var.grafana_service_type
          port = var.grafana_service_port
        }
        resources = {
          limits = {
            cpu    = var.grafana_cpu_limit
            memory = var.grafana_memory_limit
          }
          requests = {
            cpu    = var.grafana_cpu_request
            memory = var.grafana_memory_request
          }
        }
        persistence = {
          enabled = var.grafana_persistence_enabled
          size    = var.grafana_storage_size
        }
      }

      # Configuración de AlertManager
      alertmanager = {
        enabled = var.alertmanager_enabled
        alertmanagerSpec = {
          resources = {
            limits = {
              cpu    = var.alertmanager_cpu_limit
              memory = var.alertmanager_memory_limit
            }
            requests = {
              cpu    = var.alertmanager_cpu_request
              memory = var.alertmanager_memory_request
            }
          }
        }
      }

      # Configuración de Node Exporter
      nodeExporter = {
        enabled = var.node_exporter_enabled
      }

      # Configuración de Kube State Metrics
      kubeStateMetrics = {
        enabled = var.kube_state_metrics_enabled
      }
    })
  ]

  lifecycle {
    create_before_destroy = true
  }
}
