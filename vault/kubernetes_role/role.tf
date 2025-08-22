resource "vault_kubernetes_auth_backend_role" "self" {
  backend   = var.kubernetes_auth_bakend_id
  role_name = var.name

  bound_service_account_names      = var.service_accounts
  bound_service_account_namespaces = var.namespaces

  token_policies = [module.policy.name]
}
