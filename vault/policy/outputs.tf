output "name" {
  value       = var.name
  description = "name of the policy"
}

output "oidc_provider" {
  value       = var.oidc_provider
  description = "permission allow for each oidc client/ provider"
}

output "kv2" {
  value       = var.kv2
  description = "permission allow for each path of each kv2 backend"
}

output "pki" {
  value       = var.pki
  description = "permission allow for each pki backend"
}

output "audit" {
  value       = var.audit
  description = "modify audit configs"
}

output "auth" {
  value       = var.auth
  description = "audit permissions (path base)"
}

output "capabilities" {
  value       = var.capabilities
  description = "capabilities reading permission"
}

output "extra_policies" {
  value       = var.extra_policies
  description = "extra raw policies to add at the end of it"
}
