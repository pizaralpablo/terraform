variable "release_name" {
  description = "Nombre del release de Prometheus"
  type        = string
  default     = "prometheus"
}

variable "namespace" {
  description = "Namespace donde se instalará Prometheus"
  type        = string
  default     = "monitoring"
}

variable "chart_version" {
  description = "Versión del chart de Prometheus"
  type        = string
  default     = "61.0.0"
}

variable "retention" {
  description = "Tiempo de retención de métricas"
  type        = string
  default     = "15d"
}

variable "storage_class" {
  description = "Storage class para Prometheus"
  type        = string
  default     = "standard"
}

variable "storage_size" {
  description = "Tamaño del storage para Prometheus"
  type        = string
  default     = "10Gi"
}

# Prometheus Resources
variable "prometheus_cpu_limit" {
  description = "Límite de CPU para Prometheus"
  type        = string
  default     = "1000m"
}

variable "prometheus_memory_limit" {
  description = "Límite de memoria para Prometheus"
  type        = string
  default     = "2Gi"
}

variable "prometheus_cpu_request" {
  description = "Solicitud de CPU para Prometheus"
  type        = string
  default     = "500m"
}

variable "prometheus_memory_request" {
  description = "Solicitud de memoria para Prometheus"
  type        = string
  default     = "1Gi"
}

# Grafana Configuration
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

variable "grafana_service_port" {
  description = "Puerto del servicio de Grafana"
  type        = number
  default     = 80
}

variable "grafana_cpu_limit" {
  description = "Límite de CPU para Grafana"
  type        = string
  default     = "200m"
}

variable "grafana_memory_limit" {
  description = "Límite de memoria para Grafana"
  type        = string
  default     = "256Mi"
}

variable "grafana_cpu_request" {
  description = "Solicitud de CPU para Grafana"
  type        = string
  default     = "100m"
}

variable "grafana_memory_request" {
  description = "Solicitud de memoria para Grafana"
  type        = string
  default     = "128Mi"
}

variable "grafana_persistence_enabled" {
  description = "Habilitar persistencia para Grafana"
  type        = bool
  default     = true
}

variable "grafana_storage_size" {
  description = "Tamaño del storage para Grafana"
  type        = string
  default     = "5Gi"
}

# AlertManager Configuration
variable "alertmanager_enabled" {
  description = "Habilitar AlertManager"
  type        = bool
  default     = true
}

variable "alertmanager_cpu_limit" {
  description = "Límite de CPU para AlertManager"
  type        = string
  default     = "100m"
}

variable "alertmanager_memory_limit" {
  description = "Límite de memoria para AlertManager"
  type        = string
  default     = "128Mi"
}

variable "alertmanager_cpu_request" {
  description = "Solicitud de CPU para AlertManager"
  type        = string
  default     = "50m"
}

variable "alertmanager_memory_request" {
  description = "Solicitud de memoria para AlertManager"
  type        = string
  default     = "64Mi"
}

# Exporters
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
