output "release_name" {
  description = "Nombre del release de Helm"
  value       = helm_release.app.name
}

output "namespace" {
  description = "Namespace del release"
  value       = helm_release.app.namespace
}

output "status" {
  description = "Estado del release"
  value       = helm_release.app.status
}

output "version" {
  description = "Versión del release"
  value       = helm_release.app.version
}

output "manifest" {
  description = "Manifiesto YAML del release"
  value       = helm_release.app.manifest
  sensitive   = true
}
