variable "release_name" {
  description = "Nombre del release de ArgoCD"
  type        = string
  default     = "argocd"
}

variable "namespace" {
  description = "Namespace donde se instalará ArgoCD"
  type        = string
  default     = "argocd"
}

variable "chart_version" {
  description = "Versión del chart de ArgoCD"
  type        = string
  default     = "7.7.12"
}

variable "domain" {
  description = "Dominio para ArgoCD"
  type        = string
  default     = "argocd.local"
}

variable "server_service_type" {
  description = "Tipo de servicio para el servidor de ArgoCD"
  type        = string
  default     = "ClusterIP"
}

variable "server_insecure" {
  description = "Ejecutar servidor en modo inseguro (sin TLS)"
  type        = bool
  default     = true
}

variable "ingress_enabled" {
  description = "Habilitar Ingress para ArgoCD"
  type        = bool
  default     = false
}

variable "ingress_hosts" {
  description = "Hosts para Ingress"
  type        = list(string)
  default     = []
}

# Server Resources
variable "server_cpu_limit" {
  description = "Límite de CPU para el servidor"
  type        = string
  default     = "500m"
}

variable "server_memory_limit" {
  description = "Límite de memoria para el servidor"
  type        = string
  default     = "512Mi"
}

variable "server_cpu_request" {
  description = "Solicitud de CPU para el servidor"
  type        = string
  default     = "250m"
}

variable "server_memory_request" {
  description = "Solicitud de memoria para el servidor"
  type        = string
  default     = "256Mi"
}

# Controller Resources
variable "controller_cpu_limit" {
  description = "Límite de CPU para el controller"
  type        = string
  default     = "500m"
}

variable "controller_memory_limit" {
  description = "Límite de memoria para el controller"
  type        = string
  default     = "512Mi"
}

variable "controller_cpu_request" {
  description = "Solicitud de CPU para el controller"
  type        = string
  default     = "250m"
}

variable "controller_memory_request" {
  description = "Solicitud de memoria para el controller"
  type        = string
  default     = "256Mi"
}

# Repo Server Resources
variable "repo_server_cpu_limit" {
  description = "Límite de CPU para el repo server"
  type        = string
  default     = "500m"
}

variable "repo_server_memory_limit" {
  description = "Límite de memoria para el repo server"
  type        = string
  default     = "512Mi"
}

variable "repo_server_cpu_request" {
  description = "Solicitud de CPU para el repo server"
  type        = string
  default     = "250m"
}

variable "repo_server_memory_request" {
  description = "Solicitud de memoria para el repo server"
  type        = string
  default     = "256Mi"
}

# Redis Resources
variable "redis_enabled" {
  description = "Habilitar Redis"
  type        = bool
  default     = true
}

variable "redis_cpu_limit" {
  description = "Límite de CPU para Redis"
  type        = string
  default     = "200m"
}

variable "redis_memory_limit" {
  description = "Límite de memoria para Redis"
  type        = string
  default     = "256Mi"
}

variable "redis_cpu_request" {
  description = "Solicitud de CPU para Redis"
  type        = string
  default     = "100m"
}

variable "redis_memory_request" {
  description = "Solicitud de memoria para Redis"
  type        = string
  default     = "128Mi"
}


