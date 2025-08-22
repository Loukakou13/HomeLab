%{ if jsonencode(capabilities) != jsonencode({ token = null, accessor = null, self = null }) ~}
# Capabilities

%{ if capabilities.token == true ~}
path "/sys/capabilities" { capabilities = [ "update" ] } # read token capabilities
%{ endif ~}
%{ if capabilities.accessor == true ~}
path "/sys/capabilities-accessor" { capabilities = [ "update" ] } # read accessor capabilities
%{ endif ~}
%{ if capabilities.self == true ~}
path "/sys/capabilities-self" { capabilities = [ "update" ] } # read self capabilities
%{ endif ~}
%{ endif ~}
