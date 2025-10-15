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

variable "chart_path" {
  description = "Ruta al chart de Helm"
  type        = string
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

