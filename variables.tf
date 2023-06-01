variable "argocd-ingress-hosts" {
  type    = list
  default = ["argocd.local"]
}


variable "argocd-server-lb-port" {
  type    = number
  default = 8081
}

variable "kube-config-path" {
    type = string
    default = "~/.kube/config"
}

variable "argocd-namespace" {
  type = string
  default = "argocd"
}