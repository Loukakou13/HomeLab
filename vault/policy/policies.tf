resource "vault_policy" "self" {
  name = var.name
  policy = join("\n\n\n", concat(
    ["# Policy `${var.name}`\n"],
    compact([
      for module in local.modules :
      templatefile("${path.module}/templates/${module}.hcl.tpl", {
        name = var.name

        audit         = var.audit
        auth          = var.auth
        capabilities  = var.capabilities
        kv2           = var.kv2
        pki           = var.pki
        oidc_provider = var.oidc_provider

        extra_policies = var.extra_policies
      })
    ])
  ))
}
