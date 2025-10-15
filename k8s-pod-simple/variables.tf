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
  default     = "app2"
}

variable "namespace" {
  description = "Namespace donde se instalará el release"
  type        = string
  default     = "default"
}

variable "chart_name" {
  description = "Nombre del chart local en ./charts"
  type        = string
  default     = "app2"
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

