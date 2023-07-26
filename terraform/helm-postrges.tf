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
    file("values/postgres-values.yaml")
  ]
}
