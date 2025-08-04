resource "proxmox_virtual_environment_vm" "debian_vm" {
  for_each    = local.expanded_vm_map

  name        = each.key
  node_name   = "pve"
  on_boot     = true
  started     = true

  tags = concat([ "terraform" ], each.value.tags)

  cpu {
    type    = "x86-64-v2-AES"
    cores   = each.value.cores
    sockets = each.value.sockets
  }

  memory {
    dedicated = each.value.memory
    floating  = each.value.memory
  }

  disk {
    datastore_id = "local-lvm"
    import_from  = proxmox_virtual_environment_download_file.debian_12_genericcloud_amd64_qcow2.id
    interface    = "scsi0"
    size         = each.value.size
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
        address = each.value.address
      }
    }

    user_data_file_id = proxmox_virtual_environment_file.user_data_cloud_config.id
    meta_data_file_id = proxmox_virtual_environment_file.meta_data_cloud_config[each.key].id
  }
}

resource "proxmox_virtual_environment_file" "meta_data_cloud_config" {
  for_each = local.expanded_vm_map

  content_type = "snippets"
  datastore_id = "local"
  node_name    = "pve"

  source_raw {
    data = <<-EOF
    #cloud-config
    local-hostname: ${each.value.hostname}
    EOF
    file_name = "meta-data-cloud-config-${each.value.hostname}.yaml"
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
      - ufw
    runcmd:
      - systemctl enable qemu-guest-agent
      - systemctl start qemu-guest-agent
      - echo "done" > /tmp/cloud-config.done
      - ufw default deny incoming
      - ufw default allow outgoing
      - ufw allow ssh
      - ufw --force enable
    EOF

    file_name = "user-data-cloud-config.yaml"
  }
}
