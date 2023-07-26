provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

# provider "helm" {
#   kubernetes {
#     host                   = data.aws_eks_cluster.default.endpoint
#     cluster_ca_certificate = base64decode(data.aws_eks_cluster.default.certificate_authority[0].data)
#     exec {
#       api_version = "client.authentication.k8s.io/v1beta1"
#       args        = ["eks", "get-token", "--cluster-name", data.aws_eks_cluster.default.id]
#       command     = "aws"
#     }
#   }
# }


resource "helm_release" "postgres" {
  name             = "postgres"
  repository       = "https://charts.bitnami.com/bitnami"
  chart            = "postgresql"
  version          = "12.5.6"
  namespace        = "postgres"
  create_namespace = true

  set {
    name  = "global.postgresql.auth.database" # The configuration path for metrics database
    value = "testdb"                          # Replace "my_database" with the name of your PostgreSQL database
  }
  values = [
    file("postgres-values.yaml")
  ]
}

resource "kubernetes_persistent_volume_claim" "postgres_pvc" {
  metadata {
    name      = "postgres-pvc"
    namespace = "postgres"
  }

  spec {
    access_modes = ["ReadWriteOnce"]

    resources {
      requests = {
        storage = "1Gi" # Adjust the storage size as per your requirements
      }
    }
  }
}

