###
#   GitLab Umgebung
#

module "git" {

  #source     = "./terraform-lerncloud-module"
  #source = "git::https://github.com/mc-b/terraform-lerncloud-multipass"
  source     = "git::https://github.com/mc-b/terraform-lerncloud-maas"
  #source     = "git::https://github.com/mc-b/terraform-lerncloud-lernmaas"  
  #source     = "git::https://github.com/mc-b/terraform-lerncloud-aws"
  #source     = "git::https://github.com/mc-b/terraform-lerncloud-azure" 

  module      = "git-${var.host_no}-${terraform.workspace}"
  description = "GitLab"
  userdata    = "cloud-init-git.yaml"

  cores   = 2
  memory  = 8
  storage = 64
  # SSH, Kubernetes, NFS
  ports = [22, 6443, 111, 2049]

  # MAAS Server Access Info
  url = var.url
  key = var.key
  vpn = var.vpn
}

module "dev" {

  #source     = "./terraform-lerncloud-module"
  #source = "git::https://github.com/mc-b/terraform-lerncloud-multipass"
  source     = "git::https://github.com/mc-b/terraform-lerncloud-maas"
  #source     = "git::https://github.com/mc-b/terraform-lerncloud-lernmaas"  
  #source     = "git::https://github.com/mc-b/terraform-lerncloud-aws"
  #source     = "git::https://github.com/mc-b/terraform-lerncloud-azure" 

  module      = "dev-${var.host_no+1}-${terraform.workspace}"
  description = "GitLab Pipelines with docker"
  userdata    = "cloud-init-dev.yaml"

  cores   = 2
  memory  = 4
  storage = 16
  # SSH, Kubernetes, NFS
  ports = [22, 6443, 111, 2049]

  # MAAS Server Access Info
  url = var.url
  key = var.key
  vpn = var.vpn
}

module "ops" {

  #source     = "./terraform-lerncloud-module"
  #source = "git::https://github.com/mc-b/terraform-lerncloud-multipass"
  source     = "git::https://github.com/mc-b/terraform-lerncloud-maas"
  #source     = "git::https://github.com/mc-b/terraform-lerncloud-lernmaas"  
  #source     = "git::https://github.com/mc-b/terraform-lerncloud-aws"
  #source     = "git::https://github.com/mc-b/terraform-lerncloud-azure" 

  module      = "ops-${var.host_no+2}-${terraform.workspace}"
  description = "Kubernetes Production"
  userdata    = "cloud-init-k8s.yaml"

  cores   = 2
  memory  = 8
  storage = 32
  # SSH, Kubernetes, NFS
  ports = [22, 6443, 111, 2049]

  # MAAS Server Access Info
  url = var.url
  key = var.key
  vpn = var.vpn
}





