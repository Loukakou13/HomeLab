variable "ssh_key" {
  type = string
  description = "The ssh key allowed to access VMs."
}

variable "vm_list" {
  type = map(object({
    count    = optional(number, 1)
    hostname = string
    cores    = optional(number, 1)
    sockets  = optional(number, 2)
    memory   = optional(number, 2048)
    size     = optional(number, 20)
    tags     = optional(list(string), [])
    address  = optional(string, "dhcp")
  }))

  validation {
    condition = alltrue([
      for vm in values(var.vm_list) :
        vm.address == "dhcp" || can(regex("^\\d+\\.\\d+\\.\\d+\\.\\d+/\\d{1,2}$", vm.address))
    ])
    error_message = "The 'ip' needs to be an valid IPv4 address in CIDR notation (ex: 192.168.1.100/24) if it's defined."
  }
}
