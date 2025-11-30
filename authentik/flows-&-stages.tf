data "authentik_flow" "default_authorization_flow" {
  slug = "default-provider-authorization-implicit-consent"
}

data "authentik_flow" "default_authentication_flow" {
  slug = "default-authentication-flow"
}

data "authentik_flow" "default_invalidation_flow" {
  slug = "default-invalidation-flow"
}

data "authentik_flow" "default_provider_invalidation_flow" {
  slug = "default-provider-invalidation-flow"
}

data "authentik_flow" "default_user_settings_flow" {
  slug = "default-user-settings-flow"
}

resource "authentik_flow" "default_device_code_flow" {
  name           = "default-device-code-flow"
  title          = "Device Code Flow"
  slug           = "default-device-code-flow"
  designation    = "stage_configuration"
  authentication = "require_authenticated"
}

