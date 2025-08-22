terraform { 
  cloud { 
    
    organization = "Loukawai" 

    workspaces { 
      name = "Vault" 
    } 
  } 
}
