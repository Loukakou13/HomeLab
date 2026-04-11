data "authentik_group" "admins" {
  name = "authentik Admins"
}

resource "authentik_user" "netbird" {
  username = "netbird"
  name     = "netbird"
  type     = "service_account"
  path     = "goauthentik.io/service-accounts"
  groups   = [data.authentik_group.admins.id]
}

resource "authentik_token" "netbird" {
  identifier  = "netbird-app-password"
  user        = authentik_user.netbird.id
  description = "app password for netbird"
  expiring    = false
  intent      = "app_password"
}
