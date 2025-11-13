terraform {
  cloud {

    organization = "Loukawai"

    workspaces {
      name = "Authentik"
    }
  }
}
