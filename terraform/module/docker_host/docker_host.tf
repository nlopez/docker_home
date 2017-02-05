variable "name" {}
variable "domain" { default = "radoncanyon.com" }
variable "port" { default = 2376 }
variable "scheme" { default = "tcp" }
variable "subnet" { default = "172.16.8.0/22" }
variable "ip_range" {}
variable "parent" { default = "eth0" }
variable "gateway" { default = "172.16.8.1" }

provider "docker" {
  alias = "${var.name}"
  host = "${var.scheme}://${var.name}.${var.domain}:${var.port}"
}

resource "docker_network" "physical" {
  provider = "docker.${var.name}"
  name = "physical"
  driver = "macvlan"
  options = {
    parent = "${var.parent}"
  }
  ipam_config = {
    ip_range = "${var.ip_range}"
    subnet = "${var.subnet}"
    gateway = "${var.gateway}"
  }
}
