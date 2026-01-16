resource "authentik_provider_oauth2" "netbird" {
  name               = "netbird"
  client_id          = "netbird"
  authorization_flow = data.authentik_flow.default_authorization_flow.id
  invalidation_flow  = data.authentik_flow.default_provider_invalidation_flow.id
  client_type        = "public"

  allowed_redirect_uris = [
    {
      matching_mode = "regex",
      url           = "https://dashboard.netbird.loukawai.fr/.*",
    },
    {
      matching_mode = "strict",
      url           = "http://localhost:53000",
    }
  ]

  signing_key = data.authentik_certificate_key_pair.self_signed.id

  access_code_validity = "minutes=10"
  sub_mode             = "user_id"
}

resource "authentik_application" "netbird" {
  name              = "netbird"
  slug              = "netbird"
  protocol_provider = authentik_provider_oauth2.netbird.id
}
