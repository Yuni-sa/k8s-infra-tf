provider "helm" {
  kubernetes {
    config_path = var.kube-config-path
  }
}

provider "kubernetes" {
  config_path = var.kube-config-path
}

