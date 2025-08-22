variable "name" {
  type        = string
  description = "name of the policy"
}

variable "kv2" {
  type = map(map(object({
    list         = optional(bool)
    list_parrent = optional(bool)

    read   = optional(bool)
    create = optional(bool)
    modify = optional(bool)
    patch  = optional(bool)

    delete_last = optional(bool)
    delete_any  = optional(bool)
    undelete    = optional(bool)
    destroy     = optional(bool)

    read_meta   = optional(bool)
    modify_meta = optional(bool)
    patch_meta  = optional(bool)
    delete_meta = optional(bool)
  })))
  default     = {}
  description = "permission allow for each path of each kv2 backend"
}

variable "pki" {
  type = map(object({
    read_cluster_config   = optional(bool)
    modify_cluster_config = optional(bool)

    read_urls   = optional(bool)
    modify_urls = optional(bool)

    delete_all = optional(bool)

    read_crl_config   = optional(bool)
    modify_crl_config = optional(bool)
    rotate_crl        = optional(bool)
    rotate_delta_crl  = optional(bool)

    sign_intermediate = optional(bool)
    sign_self_issued  = optional(bool)
    sign_verbatim     = optional(bool)

    list_revocation_queue = optional(bool)
    list_unified_revoked  = optional(bool)
    list_revoked          = optional(bool)

    list_certifcate    = optional(bool)
    revoke_certificate = optional(bool)
    revoke_with_key    = optional(bool)

    run_tidy                = optional(bool)
    stop_tidy               = optional(bool)
    read_auto_tidy_config   = optional(bool)
    modify_auto_tidy_config = optional(bool)
    read_auto_tidy_status   = optional(bool)

    list_keys          = optional(bool)
    generate_key       = optional(set(string))
    import_key         = optional(bool)
    read_keys_config   = optional(bool)
    modify_keys_config = optional(bool)
    keys = optional(map(object({
      read   = optional(bool)
      modify = optional(bool)
      delete = optional(bool)
    })))

    generate_ca               = optional(set(string))
    generate_intermediate_csr = optional(set(string))
    cross_sign                = optional(bool)
    import_ca                 = optional(bool)
    rotate_ca                 = optional(set(string))

    list_roles = optional(bool)
    roles = optional(map(object({
      read   = optional(bool)
      modify = optional(bool)
      patch  = optional(bool)
      delete = optional(bool)

      issue         = optional(bool)
      sign          = optional(bool)
      sign_verbatim = optional(bool)
    })))

    list_issuers          = optional(bool)
    read_issuers_config   = optional(bool)
    modify_issuers_config = optional(bool)
    issuers = optional(map(object({
      read   = optional(bool)
      modify = optional(bool)
      patch  = optional(bool)

      revoke = optional(bool)
      delete = optional(bool)

      merge_crl = optional(bool)
      sign_crl  = optional(bool)

      sign_intermediate = optional(bool)
      sign_self_issued  = optional(bool)
      sign_verbatim     = optional(bool)

      roles = map(object({
        issue         = optional(bool)
        sign          = optional(bool)
        sign_verbatim = optional(bool)
      }))
    })))
  }))
  default     = {}
  description = "permission allow for each pki backend"
}

variable "oidc_provider" {
  type = object({
    list_keys = optional(bool)
    keys = optional(map(object({
      read   = optional(bool)
      create = optional(bool)
      modify = optional(bool)
      delete = optional(bool)
    })))
    list_providers = optional(bool)
    providers = optional(map(object({
      read   = optional(bool)
      create = optional(bool)
      modify = optional(bool)
      delete = optional(bool)
    })))
    list_scopes = optional(bool)
    scopes = optional(map(object({
      read   = optional(bool)
      create = optional(bool)
      modify = optional(bool)
      delete = optional(bool)
    })))
    list_clients = optional(bool)
    clients = optional(map(object({
      read   = optional(bool)
      create = optional(bool)
      modify = optional(bool)
      delete = optional(bool)
    })))
    list_assignments = optional(bool)
    assignments = optional(map(object({
      read   = optional(bool)
      create = optional(bool)
      modify = optional(bool)
      delete = optional(bool)
    })))
  })
  default     = {}
  description = "oidc provider configuration"
}

variable "audit" {
  type = object({
    list = optional(bool)
    paths = optional(map(object({
      enable  = optional(bool)
      disable = optional(bool)
      hash    = optional(bool)
    })))
  })
  default     = {}
  description = "modify audit configs"
}

variable "auth" {
  type = object({
    list = optional(bool)
    paths = optional(map(object({
      enable      = optional(bool)
      disable     = optional(bool)
      read_config = optional(bool)
      read_tune   = optional(bool)
      modify_tune = optional(bool)
    })))
  })
  default     = {}
  description = "audit permissions (path base)"
}

variable "capabilities" {
  type = object({
    token    = optional(bool)
    accessor = optional(bool)
    self     = optional(bool)
  })
  default     = {}
  description = "capabilities reading permission"
}


variable "extra_policies" {
  type        = string
  default     = ""
  description = "extra raw policies to add at the end of it"
}
