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
    enabled = true
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

    user_data_file_id = proxmox_virtual_environment_file.user_data_cloud_config.id
    meta_data_file_id = proxmox_virtual_environment_file.meta_data_cloud_config.id
  }
}

resource "proxmox_virtual_environment_file" "meta_data_cloud_config" {
  content_type = "snippets"
  datastore_id = "local"
  node_name    = "pve"

  source_raw {
    data = <<-EOF
    #cloud-config
    local-hostname: test-debian
    EOF
    file_name = "meta-data-cloud-config.yaml"
  }
}

resource "proxmox_virtual_environment_file" "user_data_cloud_config" {
  content_type = "snippets"
  datastore_id = "local"
  node_name    = "pve"

  source_raw {
    data = <<-EOF
    #cloud-config
    timezone: Europe/Paris
    users:
      - default
      - name: debian
        groups:
          - sudo
        shell: /bin/bash
        ssh_authorized_keys:
          - ${var.ssh_key}
        sudo: ALL=(ALL) NOPASSWD:ALL
    package_update: true
    packages:
      - qemu-guest-agent
      - net-tools
      - curl
    runcmd:
      - systemctl enable qemu-guest-agent
      - systemctl start qemu-guest-agent
      - echo "done" > /tmp/cloud-config.done
    EOF

    file_name = "user-data-cloud-config.yaml"
  }
}
