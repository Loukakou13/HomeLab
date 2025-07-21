variable "ssh_key" {
  type = string
  description = "The ssh key allowed to access VMs."
}

variable "vm_list" {
  type = map(object({
    count    = number
    hostname = string
    cores    = number
    sockets  = number
    memory   = number
    tags     = optional(list(string))
  }))
}
