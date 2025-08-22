variable "kubernetes_roles" {
  type = map(object({
    namespaces       = set(string) # list of namespace allowed to use this role
    service_accounts = set(string) # names of the allowed service account
    policy = object({              # the vault policy attache to the given role
      # map of kv2 backend (key => name) with the coresponding list of secret
      # what the role can read
      kv2 = optional(map(set(string)))

      # map of pki backend (key => name) with the coresponding list of role that
      # the kubernetes role can use (sign/generate certificate)
      pki = optional(map(set(string)))

      # list of oidc client that the role can read credential
      oidc = optional(set(string))

      # extra configuration for the policy
      extra_policies = optional(string)
    })
  }))
  description = "kubernetes roles configuration"
}
