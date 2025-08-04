locals {
 expanded_vm_map = merge([
    for vm_name, vm_config in var.vm_list : {
      for i in range(vm_config.count) :
      "${vm_name}${vm_config.count > 1 ? "-${i + 1}" : ""}" => {
        name     = "${vm_name}${vm_config.count > 1 ? "-${i + 1}" : ""}"
        hostname = "${vm_config.hostname}${vm_config.count > 1 ? "-${i + 1}" : ""}"
        cores    = vm_config.cores
        sockets  = vm_config.sockets
        memory   = vm_config.memory
        size     = vm_config.size
        tags     = vm_config.tags

        address = (
          vm_config.address == "dhcp" ? vm_config.address :
          join("/", [
              join(".", [
                tostring(tonumber(split(".", split("/", vm_config.address)[0])[0])),
                tostring(tonumber(split(".", split("/", vm_config.address)[0])[1])),
                tostring(tonumber(split(".", split("/", vm_config.address)[0])[2])),
                tostring(tonumber(split(".", split("/", vm_config.address)[0])[3]) + i)
              ]),
              split("/", vm_config.address)[1]
            ]
          )
        )
      }
    }
  ]...)
}
