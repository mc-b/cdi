###
#   Outputs wie IP-Adresse und DNS Name
#  

output "ip_vm" {
  value       = module.git.*.ip_vm
  description = "The IP address of the server instance."
}

output "fqdn_vm" {
  value       = module.git.*.fqdn_vm
  description = "The FQDN of the server instance."
}

output "description" {
  value       = module.git.*.description
  description = "Description VM"
}

# Einfuehrungsseite(n)

output "README" {
  value = templatefile("INTRO.md", { ip = join("", module.git.*.ip_vm), fqdn = join("", module.git.*.fqdn_vm) })
}


