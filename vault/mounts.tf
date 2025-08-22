resource "vault_mount" "infra" {
  path        = "infra"
  type        = "kv"
  options     = { version = "2" }
  description = "infrastructure secrets"
}
