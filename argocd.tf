resource "kubernetes_namespace" "argocd-ns" {
  metadata {
    name = var.argocd-namespace
  }
}

resource "helm_release" "argocd" {
  name       = "argo-cd"
  namespace  = var.argocd-namespace
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"

  set {
    name  = "server.service.type"
    value = "LoadBalancer"
  }

  set {
    name  = "server.service.loadBalancerIP"
    value = var.argocd-server-lb-port
  }

  set {
    name  = "server.ingress.enabled"
    value = "true"
  }

  set {
    name  = "server.ingress.ingressClassName"
    value = "nginx"
  }

  set {
    name  = "server.ingress.hosts[0]"
    value = var.argocd-ingress-hosts[0]
  }

  depends_on = [
    kubernetes_namespace.argocd-ns
  ]

}
