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
        infra = ["k8s/authentik/db"]
      }
    }
  }
  netbird-management = {
    namespaces       = ["netbird"]
    service_accounts = ["netbird-management"]

    policy = {
      kv2 = {
        infra = ["k8s/netbird/management"]
      }
    }
  }
  netbird-relay = {
    namespaces       = ["netbird"]
    service_accounts = ["netbird-relay"]

    policy = {
      kv2 = {
        infra = ["k8s/netbird/relay"]
      }
    }
  }
  netbird-dashboard = {
    namespaces       = ["netbird"]
    service_accounts = ["netbird-dashboard"]

    policy = {
      kv2 = {
        infra = ["k8s/netbird/dashboard"]
      }
    }
  }
}
