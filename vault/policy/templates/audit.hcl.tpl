%{ if jsonencode(audit) != jsonencode({ list = null , paths = null }) ~}
# Audit

%{ if audit.list == true ~}
path "/sys/audit" { capabilities = [ "sudo", "read" ] } # list audit
%{ endif ~}

%{ if audit.paths != null ~}
## Path
%{ for path, perm in audit.paths ~}
path "/sys/audit/${path}" {
  capabilities = [
    "sudo",
    %{ if perm.enable == true ~} "update", # enable audit
    %{ endif ~}%{ if perm.disable == true ~} "delete", # disable audit
  %{ endif ~}]
}
%{ if perm.hash == true ~}
path "sys/audit-hash/${path}" {
  capabilities = [ "update" ] # hash of the audit
}
%{ endif ~}
%{ endfor ~}
%{ endif ~}
%{ endif ~}
