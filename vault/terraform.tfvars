kubernetes_roles = {
  homarr = {
    namespaces       = ["homarr"]
    service_accounts = ["homarr-sa"]

    policy = {
      kv2 = {
        infra = ["k8s/homarr/config"]
      }
    }
  }
  authentik = {
    namespaces       = ["authentik"]
    service_accounts = ["authentik", "default"]

    policy = {
      kv2 = {
        infra = ["k8s/authentik/secrets"]
      }
    }
  }
  cloudflare-ddns = {
    namespaces       = ["cloudflare-ddns"]
    service_accounts = ["cloudflare-ddns"]

    policy = {
      kv2 = {
        infra = ["k8s/cloudflare-ddns/secrets"]
      }
    }
  }
}
