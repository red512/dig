
resource "helm_release" "prometheus" {
  name             = "monitoring"
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "kube-prometheus-stack"
  version          = "16.10.0"
  namespace        = "monitoring"
  create_namespace = true
  values = [
    file("values/prometheus-values.yaml")
  ]
}
