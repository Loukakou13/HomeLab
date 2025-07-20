terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = "0.80.0"
    }

    random = {
      source = "hashicorp/random"
      version = "3.7.2"
    }
  }
}

provider "proxmox" {
  endpoint = "https://192.168.1.5:8006/"

  insecure = true

  tmp_dir = "/var/tmp/"

  ssh {
    agent    = true
    username = "root"
  }
}

provider "random" {}
