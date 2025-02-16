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
  name         = "nginx:latest"
  keep_locally = true
  }

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = var.container_name
  ports {
    internal = 80
    external = 8089
    }
  }

output "container_id" {
  description = "ID of the Docker container"
  value       = docker_container.nginx.id
  }

output "image_id" {
  description = "ID of the Docker image"
  value       = docker_image.nginx.image_id
  }

variable "container_name" {
  description = "Value of the name for the Docker container"
  # basic types include string, number and bool
  type        = string
  default     = "BestContainerEver"
}

