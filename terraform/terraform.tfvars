ssh_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDBVXWUue9J2h59U1fXcL2RLb4DO5qJGYEJrdnDD/8sH7PdFv3p1yarGy1zkMrbm3zmIjllzSaIsptPPKtgivpK1Hez3GYcp3U/PyFgca/cGvVQDCuUz7MMenisIJASsn0WKGifycopLAvyej6BHqrJFVWWF5Vsp0GeG7CHmDauUxDQZo9reTD3EKXl0kgAabgGJGxpQCvV0a+91LydKBAoOX3a2U4aHxQh9kAfBNS/vHJ/3+gp2at0J/vFax1simWBhsyKCLzMR1W6z3QkMgXhTXosKjm9VdzOBL7L3TIYCSPOHStI2kacecpRyt+fwiMFXQegZvxHSsTLHopY5Vbt charon@louca-windows"

vm_list = {
  "k3s-m" = {
    count       = 3
    hostname    = "k3s-m"
    cores       = 2
    sockets     = 1
    memory      = 6144
    tags        = [ "kubernetes", "k3s", "k3s-m" ]
  }
  "simple-debian" = {
    hostname    = "simple-debian"
  }
  "debian-server" = {
    hostname    = "debian-server"
    cores       = 2
    memory      = 2048
    address     = "192.168.1.2/24"
    gateway     = "192.168.1.1"
    tags        = [ "dhcp", "dns" ]
  }
}
