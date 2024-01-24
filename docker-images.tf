data "docker_registry_image" "k3s" {
  name = "rancher/k3s:${var.k3s_version}"
}

resource "docker_image" "k3s" {
  name          = data.docker_registry_image.k3s.name
  pull_triggers = [data.docker_registry_image.k3s.sha256_digest]
}