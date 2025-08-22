module "policy" {
  source = "../policy"

  name = var.name

  kv2 = {
    for name, paths in coalesce(var.kv2, {}) : name => {
      for path in paths : path => { read = true }
    }
  }

  pki = {
    for name, roles in coalesce(var.pki, {}) : name => {
      roles = { for role in roles : role => { sign = true, issue = true } }
    }
  }

  oidc_provider = {
    clients = { for name in coalesce(var.oidc, []) : name => { read = true } }
  }

  extra_policies = var.extra_policies == null ? "" : var.extra_policies
}
