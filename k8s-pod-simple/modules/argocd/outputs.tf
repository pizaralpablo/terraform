output "argocd_release_name" {
  description = "Nombre del release de ArgoCD"
  value       = helm_release.argocd.name
}

output "argocd_namespace" {
  description = "Namespace de ArgoCD"
  value       = helm_release.argocd.namespace
}

output "argocd_status" {
  description = "Estado del release de ArgoCD"
  value       = helm_release.argocd.status
}

output "argocd_version" {
  description = "Versión del release de ArgoCD"
  value       = helm_release.argocd.version
}

output "argocd_server_service_name" {
  description = "Nombre del servicio del servidor de ArgoCD"
  value       = "${helm_release.argocd.name}-server"
}

output "access_instructions" {
  description = "Instrucciones para acceder a ArgoCD"
  value = {
    ui = "kubectl port-forward -n ${helm_release.argocd.namespace} svc/${helm_release.argocd.name}-server 8080:443"
    password = "kubectl -n ${helm_release.argocd.namespace} get secret argocd-initial-admin-secret -o jsonpath='{.data.password}' | base64 -d"
    username = "admin"
  }
}


