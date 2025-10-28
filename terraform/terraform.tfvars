ssh_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID9+Me6iz3qS25W9N1xu7XctUE/UZIwAt9iRhQEf2sfJ louca.guermeur@gmail.com"

vm_list = {
  "k3s-m" = {
    count    = 3
    hostname = "k3s-m"
    cores    = 2
    sockets  = 1
    memory   = 6144
    address  = "192.168.1.210/24"
    gateway  = "192.168.1.1"
    tags     = ["kubernetes", "k3s", "k3s-m"]
  }
  "simple-debian" = {
    hostname = "simple-debian"
  }
  "debian-server" = {
    hostname = "debian-server"
    cores    = 2
    memory   = 2048
    address  = "192.168.1.2/24"
    gateway  = "192.168.1.1"
    tags     = ["dhcp", "dns"]
  }
  "test" = {
    hostname = "test"
    cores    = 2
    memory   = 2048
    address  = "192.168.1.254/24"
    gateway  = "192.168.1.1"
    tags     = ["test"]
  }
}
