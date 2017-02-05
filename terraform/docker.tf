module "cecil" {
  source = "./module/docker_host"
  name = "cecil"
  ip_range = "172.16.9.0/24"
}

module "biggs" {
  source = "./module/docker_host"
  name = "cecil"
  ip_range = "172.16.10.0/24"
}

module "wedge" {
  source = "./module/docker_host"
  name = "wedge"
  ip_range = "172.16.11.0/24"
}
