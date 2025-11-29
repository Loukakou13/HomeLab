resource "authentik_user" "netbird" {
  username = "netbird"
  name     = "User"
  type     = "service_account"
}

resource "authentik_token" "netbird" {
  identifier  = "netbird-app-password"
  user        = authentik_user.netbird.id
  description = "app password for netbird"
  expiring    = false
  intent      = "app_password"
}
