locals {
  expanded_vm_map = merge([
    for vm_name, vm_config in var.vm_list : {
      for i in range(vm_config.count) :
      "${vm_name}-${i + 1}" => {
        name     = "${vm_name}-${i + 1}"
        hostname = "${vm_config.hostname}-${i + 1}"
        cores    = vm_config.cores
        sockets  = vm_config.sockets
        memory   = vm_config.memory
        tags     = lookup(vm_config, "tags", null)
      }
    }
  ]...)
}
