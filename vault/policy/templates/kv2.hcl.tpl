%{ if jsonencode(kv2) != jsonencode({}) ~}
# KV2
%{ for kv2_name, kv2_config in kv2 ~}


##  "${kv2_name}" backend
%{ for path, perm in kv2_config ~}

### ${kv2_name}/${path}
%{ if perm.list_parrent == true ~}
#### Parrent
%{ for index in range(length(split("/", path))) ~}
path "${kv2_name}/metadata/${join("/", slice(split("/", path), 0, index))}" { capabilities = [ "list" ] }
%{ endfor ~}
#### Path
%{ endif ~}
path "${kv2_name}/data/${path}" {
  capabilities = [
    %{ if perm.read == true ~} "read", # read secret
    %{ endif ~}%{ if perm.create == true ~} "create", # create secret
    %{ endif ~}%{ if perm.modify == true ~} "update", # modify secret
    %{ endif ~}%{ if perm.patch == true ~} "patch", # patch secret
    %{ endif ~}%{ if perm.delete_last == true ~} "delete", # delete last secret
  %{ endif ~}]
}
path "${kv2_name}/metadata/${path}" {
  capabilities = [
     %{ if perm.list == true } "list", # list sub secret
     %{ endif ~}%{ if perm.read_meta == true } "read", # view version metadata
     %{ endif ~}%{ if perm.modify_meta == true } "update", # modify metadata secret
     %{ endif ~}%{ if perm.patch_meta == true } "patch", # patch metadata
     %{ endif ~}%{ if perm.delete_meta == true } "delete", # delete metadata secret
   %{ endif ~}]
}
%{ if perm.delete_any == true ~}
path "${kv2_name}/delete/${path}" {
  capabilities = [ "update" ] # delete any secret
}
%{ endif ~}
%{ if perm.undelete == true ~}
path "${kv2_name}/undelete/${path}" {
  capabilities = [ "update" ] # undelete any secret
}
%{ endif ~}
%{ if perm.destroy == true ~}
path "${kv2_name}/destroy/${path}" {
  capabilities = [ "update" ] # destroy any secret
}
%{ endif ~}

%{ endfor }
%{ endfor }
%{ endif ~}
