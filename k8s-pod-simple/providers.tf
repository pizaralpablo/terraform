provider "kubernetes" {
  config_path    = var.kubeconfig_path != "" ? var.kubeconfig_path : pathexpand("~/.kube/config")
  config_context = var.kubeconfig_context
}

provider "helm" {
  kubernetes {
    config_path    = var.kubeconfig_path != "" ? var.kubeconfig_path : pathexpand("~/.kube/config")
    config_context = var.kubeconfig_context
  }
}