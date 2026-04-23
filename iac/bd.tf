resource "docker_container" "bd" {
  name  = "bd-${terraform.workspace}"
  image = "postgres:15"

  networks_advanced {
    name = docker_network.app_network.name
  }

  ports {
    internal = 5432
    external = var.bd_port[terraform.workspace]
  }

  env = [
    "POSTGRES_PASSWORD=postgres",
    "POSTGRES_USER=postgres",
    "POSTGRES_DB=appdb"
  ]
}