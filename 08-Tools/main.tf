###
#   Kubernetes Umgebung
#

module "gitlab" {

  #source     = "./terraform-lerncloud-module"
  #source = "git::https://github.com/mc-b/terraform-lerncloud-multipass"
  source     = "git::https://github.com/mc-b/terraform-lerncloud-maas"
  #source     = "git::https://github.com/mc-b/terraform-lerncloud-lernmaas"  
  #source     = "git::https://github.com/mc-b/terraform-lerncloud-aws"
  #source     = "git::https://github.com/mc-b/terraform-lerncloud-azure" 

  module      = "gitlab-${var.host_no}-${terraform.workspace}"
  description = "GitLab"
  userdata    = "cloud-init.yaml"

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



