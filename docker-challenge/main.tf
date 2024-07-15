# main.tf
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.22.0"
    }
  }
}
provider "docker" {}
resource "docker_image" "nginx" {
  name         = "nginx:1.23.4"
  keep_locally = true       // keep image after "destroy"
}
resource "docker_container" "simplegoservice" {
  image = "registry.gitlab.com/alta3/simplegoservice"
  name  = var.container_name
  ports {
    internal = var.internal_port
    external = var.external_port
  }
}

