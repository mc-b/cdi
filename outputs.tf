###
# Einfuehrungsseite(n)

output "README" {
  value = templatefile("INTRO.md", { git = module.git.fqdn_vm, dev = module.dev.fqdn_vm, cicd = module.cicd.fqdn_vm })
}


