module "kubernetes_roles" {
  for_each = var.kubernetes_roles

  source = "./kubernetes_role"

  kubernetes_auth_bakend_id = vault_auth_backend.kubernetes.id

  name = each.key

  namespaces       = each.value.namespaces
  service_accounts = each.value.service_accounts

  oidc           = each.value.policy.oidc
  kv2            = each.value.policy.kv2
  pki            = each.value.policy.pki
  extra_policies = each.value.policy.extra_policies
}
