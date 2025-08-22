%{ if jsonencode(auth) != jsonencode({ list = null , paths = null }) ~}
# Auth

%{ if auth.list == true ~}
path "/sys/auth" { capabilities = [ "read" ] } # list audit
%{ endif ~}

%{ if auth.paths != null ~}
## Path
%{ for path, perm in auth.paths ~}
path "/sys/auth/${path}" {
  capabilities = [
    %{ if perm.enable == true || perm.disable == true ~} "sudo", # need for enable and disable
    %{ endif ~}%{ if perm.enable == true ~} "update", # enable auth
    %{ endif ~}%{ if perm.read_config == true ~} "read", # enable auth
    %{ endif ~}%{ if perm.disable == true ~} "delete", # disable auth
  %{ endif ~}]
}
%{ if perm.read_tune == true || perm.modify_tune == true ~}
path "/sys/auth/${path}/tune" {
  capabilities = [
    "sudo", # need for read an tune
    %{ if perm.read_tune == true ~} "read", # read tune
    %{ endif ~}%{ if perm.modify_tune == true ~} "update", # modify tune
  %{ endif ~}]
}
%{ endif ~}
%{ endfor ~}
%{ endif ~}
%{ endif ~}
