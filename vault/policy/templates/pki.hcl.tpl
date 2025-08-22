%{ if jsonencode(pki) != jsonencode({}) ~}
# pki
%{ for pki_name, config in pki ~}
##  "${pki_name}" backend
%{ if config.read_urls == true || config.modify_urls == true ~}
path "${pki_name}/config/urls" {
  capabilities = [
    %{ if config.read_urls == true ~} "read", # read url config
    %{ endif ~}%{ if config.modify_urls == true ~} "update", # modify url config
  %{ endif ~}]
}

%{ endif }%{ if config.read_issuers_config == true || config.modify_issuers_config == true ~}
path "${pki_name}/config/issuers" {
  capabilities = [
    %{ if config.read_issuers_config == true ~} "read", # read issuers config
    %{ endif ~}%{ if config.modify_issuers_config == true ~} "update", # modify issuers config
  %{ endif ~}]
}

%{ endif }%{ if config.modify_issuers_config == true ~}
path "${pki_name}/root/replace" {
  capabilities = [ "update" ] # modify issuer config
}

%{ endif ~}%{ if config.read_keys_config == true || config.modify_keys_config == true ~}
path "${pki_name}/config/keys" {
  capabilities = [
    %{ if config.read_keys_config == true ~} "read", # read keys config
    %{ endif ~}%{ if config.modify_keys_config == true ~} "update", # modify keys config
  %{ endif ~}]
}

%{ endif }%{ if config.read_cluster_config == true || config.modify_cluster_config == true ~}
path "${pki_name}/config/cluster" {
  capabilities = [
    %{ if config.read_cluster_config == true ~} "read", # read cluster config
    %{ endif ~}%{ if config.modify_cluster_config == true ~} "update", # modify cluster config
  %{ endif ~}]
}

%{ endif }%{ if config.read_crl_config == true || config.modify_crl_config == true ~}
path "${pki_name}/config/crl" {
  capabilities = [
    %{ if config.read_crl_config == true ~} "read", # read crl config
    %{ endif ~}%{ if config.modify_crl_config == true ~} "update", # modify crl config
  %{ endif ~}]
}

%{ endif }%{ if config.run_tidy == true ~}
path "${pki_name}/tidy" {
  capabilities = [ "update" ] # run tidy
}

%{ endif ~}%{ if config.read_auto_tidy_config == true || config.modify_auto_tidy_config == true ~}
path "${pki_name}/config/auto-tidy" {
  capabilities = [
    %{ if config.read_auto_tidy_config == true ~} "read", # read auto_tidy config
    %{ endif ~}%{ if config.modify_auto_tidy_config == true ~} "update", # modify auto_tidy config
  %{ endif ~}]
}

%{ endif }%{ if config.read_auto_tidy_status == true ~}
path "${pki_name}/tidy-status" {
  capabilities = [ "read" ] # read auto tidy status
}

%{ endif ~}%{ if config.stop_tidy == true ~}
path "${pki_name}/tidy-cancel" {
  capabilities = [ "update" ] # cancel tidy
}

%{ endif ~}%{ if config.rotate_crl == true ~}
path "${pki_name}/crl/rotate" {
  capabilities = [ "read" ] # rotate crl
}

%{ endif ~}%{ if config.rotate_delta_crl == true ~}
path "${pki_name}/crl/rotate-delta" {
  capabilities = [ "read" ] # rotate delta crl
}

%{ endif ~}%{ for type in coalesce(config.generate_ca, []) ~}
path "${pki_name}/root/generate/${type}" {
  capabilities = [ "update" ] # generate a self signed cert
}
path "${pki_name}/issuers/generate/root/${type}" {
  capabilities = [ "update" ] # generate a self signed cert v2
}
%{ endfor ~}
%{ for type in coalesce(config.rotate_ca, []) ~}
path "${pki_name}/root/rotate/${type}" {
  capabilities = [ "update" ] # rotate the current ca
}
%{ endfor ~}
%{ for type in coalesce(config.generate_intermediate_csr, []) ~}
path "${pki_name}/intermediate/generate/${type}" {
  capabilities = [ "update" ] # generate a csr to be an intermediate ca
}
path "${pki_name}/issuers/generate/intermediate/${type}" {
  capabilities = [ "update" ] # generate a csr to be an intermediate ca v2
}
%{ endfor ~}
%{ if config.import_ca == true ~}
path "${pki_name}/config/ca" {
  capabilities = [ "update" ] # import ca
}
path "${pki_name}/issuers/import/bundle" {
  capabilities = [ "update" ] # import ca v2
}
path "${pki_name}/issuers/import/cert" {
  capabilities = [ "update" ] # import ca v3
}
path "${pki_name}/intermediate/set-signed" {
  capabilities = [ "update" ] # import ca v4
}

%{ endif ~}%{ if config.cross_sign == true ~}
path "${pki_name}/intermediate/cross-sign" {
  capabilities = [ "update" ] # Sign intermediate
}

%{ endif ~}%{ if config.sign_intermediate == true ~}
path "${pki_name}/root/sign-intermediate" {
  capabilities = [ "update" ] # Sign intermediate
}

%{ endif ~}%{ if config.sign_self_issued == true ~}
path "${pki_name}/root/sign-self-issued" {
  capabilities = [ "sudo", "update" ] # Sign intermediate
}

%{ endif ~}%{ if config.sign_verbatim == true ~}
path "${pki_name}/sign-verbatim" {
  capabilities = [ "update" ] # Sign verbatine csr
}

%{ endif ~}%{ if config.delete_all == true ~}
path "${pki_name}/root" {
  capabilities = [ "sudo", "delete" ] # delete all issuer and keys
}

%{ endif ~}%{ if config.list_certifcate == true ~}
path "${pki_name}/certs" {
  capabilities = [ "list" ] # list certifaces
}

%{ endif ~}%{ if config.list_revoked == true ~}
path "${pki_name}/revoked" {
  capabilities = [ "list" ] # list revoked certificate
}

%{ endif ~}%{ if config.list_revocation_queue == true ~}
path "${pki_name}/revocation-queue" {
  capabilities = [ "list" ] # list certificate requested to be revoke
}

%{ endif ~}%{ if config.list_unified_revoked == true ~}
path "${pki_name}/unified-revoked" {
  capabilities = [ "list" ] # list revoked certificate on any cluster
}

%{ endif ~}%{ if config.revoke_certificate == true ~}
path "${pki_name}/revoke" {
  capabilities = [ "update" ] # revoke given certificate
}

%{ endif ~}%{ if config.revoke_with_key == true ~}
path "${pki_name}/revoke-with-key" {
  capabilities = [ "update" ] # revoke given certificate base on his key
}
%{ endif ~}

### Keys
%{ if config.list_keys == true ~}
path "${pki_name}/keys" {
  capabilities = [ "list" ] # list keys
}

%{ endif ~}%{ if config.import_key == true ~}
path "${pki_name}/keys/import" {
  capabilities = [ "update" ] # import key
}

%{ endif ~}%{ for type in coalesce(config.generate_key, []) ~}
path "${pki_name}/keys/generate/${type}" {
  capabilities = [ "update" ] # generate keys
}

%{ endfor ~}%{ for key_name, key in coalesce(config.keys, {}) ~}
path "${pki_name}/keys/${key_name}" {
  capabilities = [
    %{ if key.read == true ~} "read", # read key
    %{ endif ~}%{ if key.modify == true ~} "update", # modify key
    %{ endif ~}%{ if key.delete == true ~} "delete", # delete key
  %{ endif ~}]
}

%{ endfor ~}
### Roles
%{ if config.list_roles == true ~}
path "${pki_name}/roles" {
  capabilities = [ "list" ] # list roles
}
%{ endif ~}
%{ for role_name, role in coalesce(config.roles, {}) ~}
####  "${role_name}" role
%{ if role.read == true || role.modify == true || role.patch == true || role.delete == true ~}
path "${pki_name}/roles/${role_name}" {
  capabilities = [
    %{ if role.read == true ~} "read", # read role
    %{ endif ~}%{ if role.modify == true ~} "update", # modify role
    %{ endif ~}%{ if role.patch == true ~} "patch", # patch role
    %{ endif ~}%{ if role.delete == true ~} "delete", # delete role
  %{ endif ~}]
}

%{ endif }%{ if role.sign_verbatim == true ~}
path "${pki_name}/sign-verbatim/${role_name}" {
  capabilities = [ "update" ] # Sign verbatine csr
}

%{ endif ~}%{ if role.issue == true ~}
path "${pki_name}/issue/${role_name}" {
  capabilities = [ "update" ] # issue a certificate
}
%{ endif ~}%{ if role.sign == true ~}
path "${pki_name}/sign/${role_name}" {
  capabilities = [ "update" ] # sign a certificate
}

%{ endif ~}
%{ endfor }
### Issuer
%{ if config.list_issuers == true ~}
path "${pki_name}/issuers" {
  capabilities = [ "list" ] # list issuers
}
%{ endif ~}%{ for issuer_name, issuer in coalesce(config.issuers, {}) ~}
####  "${issuer_name}" issuer
%{ if issuer.read == true || issuer.modify == true || issuer.patch == true || issuer.delete == true ~}
path "${pki_name}/issuer/${issuer_name}" {
  capabilities = [
    %{ if issuer.read == true ~} "read", # read issuer
    %{ endif ~}%{ if issuer.modify == true ~} "update", # modify issuer
    %{ endif ~}%{ if issuer.patch == true ~} "patch", # patch issuer
    %{ endif ~}%{ if issuer.delete == true ~} "delete", # delete issuer
  %{ endif ~}]
}
%{ endif }%{ if issuer.revoke == true ~}
path "${pki_name}/issuer/${issuer_name}/revoke" {
  capabilities = [ "update" ] # revoke
}

%{ endif ~}%{ if issuer.merge_crl == true ~}
path "${pki_name}/issuer/${issuer_name}/resign-crls" {
  capabilities = [ "update" ] # Combine CRLs from the same issuer
}

%{ endif ~}%{ if issuer.sign_crl == true ~}
path "${pki_name}/issuer/${issuer_name}/sign-revocation-list" {
  capabilities = [ "update" ] # Sign revocation list
}

%{ endif ~}%{ if issuer.sign_intermediate == true ~}
path "${pki_name}/issuer/${issuer_name}/sign-intermediate" {
  capabilities = [ "update" ] # Sign intermediate
}

%{ endif ~}%{ if issuer.sign_self_issued == true ~}
path "${pki_name}/issuer/${issuer_name}/sign-self-issued" {
  capabilities = [ "sudo", "update" ] # Sign intermediate
}

%{ endif ~}%{ if issuer.sign_verbatim == true ~}
path "${pki_name}/issuer/${issuer_name}/sign-verbatim" {
  capabilities = [ "update" ] # Sign verbatine csr
}

%{ endif ~}%{ for role_name, role in issuer.roles ~}
####  "${issuer_name}/${role_name}" role
%{ if role.issue == true ~}
path "${pki_name}/issuer/${issuer_name}/issue/${role_name}" {
  capabilities = [ "update" ] # issue a certificate with the given issuer
}
%{ endif ~}%{ if role.sign == true ~}
path "${pki_name}/issuer/${issuer_name}/sign/${role_name}" {
  capabilities = [ "update" ] # sign a certificate with the given issuer
}

%{ endif ~}%{ if role.sign_verbatim == true ~}
path "${pki_name}/issuer/${issuer_name}/sign-verbatim/${role_name}" {
  capabilities = [ "update" ] # Sign verbatine csr
}

%{ endif ~}
%{ endfor ~}
%{ endfor ~}
%{ endfor ~}
%{ endif ~}
