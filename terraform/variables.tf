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
  }))
}
