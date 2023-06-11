resource "kubernetes_namespace" "otterize-ns" {
  metadata {
    name = var.otterize-namespace
  }
}

resource "helm_release" "network_mapper" {
  name             = "network-mapper"
  repository       = "otterize/network-mapper"
  chart            = var.otterize-namespace
  namespace        = "otterize-system"
  create_namespace = true
  wait             = true
}
