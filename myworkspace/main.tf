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
  keep_locally = true    // keep image after "destroy"
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  # here we removed the name "tutorial" for the container
  # and replace it with a call to a variable
  # name  = "tutorial"
  name = var.container_name
  ports {
    # internal and external are now defined by variables
    internal = var.internal_port
    external = var.external_port
  }
}

variable "port_from_root" {
  default = 1234 }

module "my_container" {
  source = "./project-tf/my_modules/container_maker"
  external_port = var.port_from_root
}
