terraform {
  required_providers {
    authentik = {
      source  = "goauthentik/authentik"
      version = "2025.10.0"
    }
  }
}

provider "authentik" {
  url   = "https://authentik.loukawai.fr"
  token = var.authentik_token
}

