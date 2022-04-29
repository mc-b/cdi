###
#   Outputs wie IP-Adresse und DNS Name
#  

output "ip_vm" {
  value       = module.gitlab.ip_vm
  description = "The IP address of the server instance."
}

output "fqdn_vm" {
  value       = module.gitlab.fqdn_vm
  description = "The FQDN of the server instance."
}

output "description" {
  value       = module.gitlab.description
  description = "Description VM"
}

# Einfuehrungsseite(n)

output "README" {
  value = templatefile("INTRO.md", { ip = module.gitlab.ip_vm, fqdn = module.gitlab.fqdn_vm })
}


