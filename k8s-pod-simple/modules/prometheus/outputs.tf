output "prometheus_release_name" {
  description = "Nombre del release de Prometheus"
  value       = helm_release.prometheus.name
}

output "prometheus_namespace" {
  description = "Namespace de Prometheus"
  value       = helm_release.prometheus.namespace
}

output "prometheus_status" {
  description = "Estado del release de Prometheus"
  value       = helm_release.prometheus.status
}

output "prometheus_version" {
  description = "Versión del release de Prometheus"
  value       = helm_release.prometheus.version
}

output "grafana_service_name" {
  description = "Nombre del servicio de Grafana"
  value       = var.grafana_enabled ? "${helm_release.prometheus.name}-grafana" : null
}

output "prometheus_service_name" {
  description = "Nombre del servicio de Prometheus"
  value       = "${helm_release.prometheus.name}-kube-prometheus-prometheus"
}

output "alertmanager_service_name" {
  description = "Nombre del servicio de AlertManager"
  value       = var.alertmanager_enabled ? "${helm_release.prometheus.name}-kube-prometheus-alertmanager" : null
}

output "access_instructions" {
  description = "Instrucciones para acceder a los servicios"
  value = {
    prometheus = "kubectl port-forward -n ${helm_release.prometheus.namespace} svc/${helm_release.prometheus.name}-kube-prometheus-prometheus 9090:9090"
    grafana    = var.grafana_enabled ? "kubectl port-forward -n ${helm_release.prometheus.namespace} svc/${helm_release.prometheus.name}-grafana 3000:80" : null
    alertmanager = var.alertmanager_enabled ? "kubectl port-forward -n ${helm_release.prometheus.namespace} svc/${helm_release.prometheus.name}-kube-prometheus-alertmanager 9093:9093" : null
  }
}
