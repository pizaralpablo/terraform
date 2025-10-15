variable "kubeconfig_path" {
  description = "Ruta al kubeconfig a usar"
  type        = string
  default     = ""
}

variable "kubeconfig_context" {
  description = "Contexto de kubeconfig a usar (opcional)"
  type        = string
  default     = null
}

variable "release_name" {
  description = "Nombre del release de Helm"
  type        = string
  default     = "app"
}

variable "namespace" {
  description = "Namespace donde se instalará el release"
  type        = string
  default     = "default"
}

variable "chart_name" {
  description = "Nombre del chart local en ./charts"
  type        = string
  default     = "app"
}

variable "image_repository" {
  description = "Repositorio de la imagen"
  type        = string
  default     = "nginx"
}

variable "image_tag" {
  description = "Tag de la imagen"
  type        = string
  default     = "stable"
}

variable "replicas" {
  description = "Número de réplicas"
  type        = number
  default     = 1
}

variable "resources_limits_cpu" {
  description = "Límite de CPU"
  type        = string
  default     = "250m"
}

variable "resources_limits_memory" {
  description = "Límite de memoria"
  type        = string
  default     = "256Mi"
}

variable "resources_requests_cpu" {
  description = "Solicitud de CPU"
  type        = string
  default     = "100m"
}

variable "resources_requests_memory" {
  description = "Solicitud de memoria"
  type        = string
  default     = "128Mi"
}

variable "service_type" {
  description = "Tipo de servicio"
  type        = string
  default     = "ClusterIP"
}

variable "service_port" {
  description = "Puerto del servicio"
  type        = number
  default     = 80
}

# Prometheus Variables
variable "prometheus_release_name" {
  description = "Nombre del release de Prometheus"
  type        = string
  default     = "prometheus"
}

variable "prometheus_namespace" {
  description = "Namespace de Prometheus"
  type        = string
  default     = "monitoring"
}

variable "prometheus_chart_version" {
  description = "Versión del chart de Prometheus"
  type        = string
  default     = "61.0.0"
}

variable "prometheus_retention" {
  description = "Tiempo de retención de métricas"
  type        = string
  default     = "15d"
}

variable "prometheus_storage_class" {
  description = "Storage class para Prometheus"
  type        = string
  default     = "standard"
}

variable "prometheus_storage_size" {
  description = "Tamaño del storage para Prometheus"
  type        = string
  default     = "10Gi"
}

# Grafana Variables
variable "grafana_enabled" {
  description = "Habilitar Grafana"
  type        = bool
  default     = true
}

variable "grafana_password" {
  description = "Contraseña de administrador de Grafana"
  type        = string
  default     = "admin"
  sensitive   = true
}

variable "grafana_service_type" {
  description = "Tipo de servicio de Grafana"
  type        = string
  default     = "ClusterIP"
}

# AlertManager Variables
variable "alertmanager_enabled" {
  description = "Habilitar AlertManager"
  type        = bool
  default     = true
}

# Exporter Variables
variable "node_exporter_enabled" {
  description = "Habilitar Node Exporter"
  type        = bool
  default     = true
}

variable "kube_state_metrics_enabled" {
  description = "Habilitar Kube State Metrics"
  type        = bool
  default     = true
}

# ServiceMonitor Variables
variable "service_monitor_enabled" {
  description = "Habilitar ServiceMonitor para Prometheus"
  type        = bool
  default     = true
}

variable "metrics_interval" {
  description = "Intervalo de recolección de métricas"
  type        = string
  default     = "30s"
}

variable "metrics_scrape_timeout" {
  description = "Timeout para scrape de métricas"
  type        = string
  default     = "10s"
}

variable "metrics_path" {
  description = "Ruta del endpoint de métricas"
  type        = string
  default     = "/metrics"
}

# ArgoCD Variables
variable "argocd_release_name" {
  description = "Nombre del release de ArgoCD"
  type        = string
  default     = "argocd"
}

variable "argocd_namespace" {
  description = "Namespace de ArgoCD"
  type        = string
  default     = "argocd"
}

variable "argocd_chart_version" {
  description = "Versión del chart de ArgoCD"
  type        = string
  default     = "7.7.12"
}

variable "argocd_server_service_type" {
  description = "Tipo de servicio para el servidor de ArgoCD"
  type        = string
  default     = "ClusterIP"
}

variable "argocd_server_insecure" {
  description = "Ejecutar servidor de ArgoCD en modo inseguro (sin TLS)"
  type        = bool
  default     = true
}

variable "argocd_ingress_enabled" {
  description = "Habilitar Ingress para ArgoCD"
  type        = bool
  default     = false
}
