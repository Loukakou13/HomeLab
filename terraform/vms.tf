resource "proxmox_virtual_environment_vm" "debian_vm" {
  name        = "debian-cloudinit-vm"
  node_name   = "pve"
  vm_id       = 101
  on_boot     = true
  started     = true

  cpu {
    type    = "x86-64-v2-AES"
    cores   = 2
    sockets = 1
  }

  memory {
    dedicated = 2048
    floating  = 2048
  }

  disk {
    datastore_id = "local-lvm"
    import_from  = proxmox_virtual_environment_download_file.debian_12_genericcloud_amd64_qcow2.id
    interface    = "scsi0"
    size         = 20
  }

  network_device {
    model     = "virtio"
    bridge    = "vmbr0"
  }

  agent {
    enabled = false
  }

  operating_system {
    type = "l26"
  }
  
  serial_device {}

 initialization {
    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }

    user_account {
      keys     = ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDBVXWUue9J2h59U1fXcL2RLb4DO5qJGYEJrdnDD/8sH7PdFv3p1yarGy1zkMrbm3zmIjllzSaIsptPPKtgivpK1Hez3GYcp3U/PyFgca/cGvVQDCuUz7MMenisIJASsn0WKGifycopLAvyej6BHqrJFVWWF5Vsp0GeG7CHmDauUxDQZo9reTD3EKXl0kgAabgGJGxpQCvV0a+91LydKBAoOX3a2U4aHxQh9kAfBNS/vHJ/3+gp2at0J/vFax1simWBhsyKCLzMR1W6z3QkMgXhTXosKjm9VdzOBL7L3TIYCSPOHStI2kacecpRyt+fwiMFXQegZvxHSsTLHopY5Vbt charon@louca-windows"]
      username = "debian"
      password = random_password.vm_password.result
    }
  }
}

resource "random_password" "vm_password" {
  length           = 16
  override_special = "_%@"
  special          = true
}