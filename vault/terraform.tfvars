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
}
