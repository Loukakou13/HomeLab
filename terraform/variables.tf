variable "ssh_key" {
  type = string
  description = "The ssh key allowed to access VMs."
}

variable "vm_list" {
  type = map(object({
    name     = string
    vm_id    = number
    hostname = string
    cores    = number
    sockets  = number
    memory   = number
  }))
}
