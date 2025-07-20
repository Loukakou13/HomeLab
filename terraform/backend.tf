terraform { 
  cloud { 

    organization = "Loukawai" 

    workspaces { 
      name = "Proxmox" 
    } 
  } 
}