output "role" {
  value       = vault_kubernetes_auth_backend_role.self
  description = "the role itself"
}

output "policy" {
  value       = module.policy
  description = "the role itself"
}

output "name" {
  value       = var.name
  description = "name of the k8s role"
}

output "namespaces" {
  value       = var.namespaces
  description = "list of namespace allowed to use this role"
}

output "service_accounts" {
  value       = var.service_accounts
  description = "names of the allowed service account"
}

output "kv2" {
  value       = var.kv2
  description = "that the role can read"
}

output "pki" {
  value       = var.pki
  description = "the kubernetes role can use (sign/generate certificate)"
}

output "oidc" {
  value       = var.oidc
  description = "list of oidc client that the role can read credential"
}

output "extra_policies" {
  value       = var.extra_policies
  description = "extra configuration for the policy"
}
