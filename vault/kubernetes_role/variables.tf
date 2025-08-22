variable "kubernetes_auth_bakend_id" {
  type        = string
  description = "the id of the kubernetes auth backend"
}

variable "name" {
  type        = string
  description = "name of the k8s role"
}

variable "namespaces" {
  type        = set(string)
  description = "list of namespace allowed to use this role"
}

variable "service_accounts" {
  type        = set(string)
  description = "names of the allowed service account"
}

variable "kv2" {
  type        = map(set(string))
  description = "KV2 policies"
}

variable "pki" {
  type        = map(set(string))
  description = "PKI policies"
}

variable "oidc" {
  type        = set(string)
  description = "OIDC policies"
}

variable "extra_policies" {
  type        = string
  description = "extra policies"
}
