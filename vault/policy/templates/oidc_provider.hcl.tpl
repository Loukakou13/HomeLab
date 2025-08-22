%{ if jsonencode(oidc_provider) != jsonencode({
    list_providers = null,
    providers = null,
    list_keys = null,
    keys = null,
    list_scopes = null,
    scopes = null,
    list_clients = null,
    clients = null,
    list_assignments = null,
    assignments = null,
}) ~}
# OIDC Provider

## Keys
%{ if oidc_provider.list_keys == true ~}
path "/identity/oidc/key" {
  capabilities = [ "list" ] # list keys
}
%{ endif ~}
%{ for key, perm in coalesce(oidc_provider.keys, {}) ~}

path "/identity/oidc/key/${key}" {
  capabilities = [
    %{ if perm.read == true ~} "read", # read key
    %{ endif ~}%{ if perm.create == true ~} "create", # modify key
    %{ endif ~}%{ if perm.modify == true ~} "update", # modify key
    %{ endif ~}%{ if perm.delete == true ~} "delete", # delete key
  %{ endif ~}]
}
%{ endfor ~}
## Providers
%{ if oidc_provider.list_providers == true ~}
path "/identity/oidc/provider" {
  capabilities = [ "list" ] # list providers
}
%{ endif ~}
%{ for provider, perm in coalesce(oidc_provider.providers, {}) ~}

path "/identity/oidc/provider/${provider}" {
  capabilities = [
    %{ if perm.read == true ~} "read", # read provider
    %{ endif ~}%{ if perm.create == true ~} "create", # modify provider
    %{ endif ~}%{ if perm.modify == true ~} "update", # modify provider
    %{ endif ~}%{ if perm.delete == true ~} "delete", # delete provider
  %{ endif ~}]
}
%{ endfor ~}
## Scopes
%{ if oidc_provider.list_scopes == true ~}
path "/identity/oidc/scope" {
  capabilities = [ "list" ] # list scopes
}
%{ endif ~}
%{ for scope, perm in coalesce(oidc_provider.scopes, {}) ~}

path "/identity/oidc/scope/${scope}" {
  capabilities = [
    %{ if perm.read == true ~} "read", # read scope
    %{ endif ~}%{ if perm.create == true ~} "create", # modify scope
    %{ endif ~}%{ if perm.modify == true ~} "update", # modify scope
    %{ endif ~}%{ if perm.delete == true ~} "delete", # delete scope
  %{ endif ~}]
}
%{ endfor ~}
## Clients
%{ if oidc_provider.list_clients == true ~}
path "/identity/oidc/client" {
  capabilities = [ "list" ] # list clients
}
%{ endif ~}
%{ for client, perm in coalesce(oidc_provider.clients, {}) ~}

path "/identity/oidc/client/${client}" {
  capabilities = [
    %{ if perm.read == true ~} "read", # read client
    %{ endif ~}%{ if perm.create == true ~} "create", # modify client
    %{ endif ~}%{ if perm.modify == true ~} "update", # modify client
    %{ endif ~}%{ if perm.delete == true ~} "delete", # delete client
  %{ endif ~}]
}
%{ endfor ~}
## Assignments
%{ if oidc_provider.list_assignments == true ~}
path "/identity/oidc/assignment" {
  capabilities = [ "list" ] # list assignments
}
%{ endif ~}
%{ for assignment, perm in coalesce(oidc_provider.assignments, {}) ~}

path "/identity/oidc/assignment/${assignment}" {
  capabilities = [
    %{ if perm.read == true ~} "read", # read assignment
    %{ endif ~}%{ if perm.create == true ~} "create", # modify assignment
    %{ endif ~}%{ if perm.modify == true ~} "update", # modify assignment
    %{ endif ~}%{ if perm.delete == true ~} "delete", # delete assignment
  %{ endif ~}]
}
%{ endfor ~}
%{ endif ~}
