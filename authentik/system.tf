data "authentik_certificate_key_pair" "self_signed" {
  name = "authentik Self-signed Certificate"
}

resource "authentik_brand" "default" {
  domain = "authentik-default"

  default          = true
  branding_title   = "authentik"
  branding_logo    = "/static/dist/assets/icons/icon_left_brand.svg"
  branding_favicon = "/static/dist/assets/icons/icon.png"

  flow_authentication = data.authentik_flow.default_authentication_flow.id
  flow_invalidation   = data.authentik_flow.default_invalidation_flow.id
  flow_user_settings  = data.authentik_flow.default_user_settings_flow.id
  flow_device_code    = authentik_flow.default_device_code_flow.uuid
}
