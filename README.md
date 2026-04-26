# HomeLab

Personal homelab infrastructure managed as code. Everything from VM provisioning to application deployment is automated and version-controlled.

## Stack

- **Proxmox** — hypervisor
- **Terraform** — VM and service provisioning
- **Ansible** — OS configuration and Kubernetes bootstrap
- **K3s** — 3-node highly available Kubernetes cluster
- **ArgoCD** — GitOps continuous deployment

## What's deployed

- **Media**: Jellyfin, Radarr, Sonarr, Prowlarr, qBittorrent (behind VPN)
- **Access**: Authentik (SSO), Homarr (dashboard)
- **Networking**: MetalLB, NGINX Gateway, CoreDNS, Cloudflare DDNS
- **Storage**: Longhorn, NFS
- **Monitoring**: Prometheus, Grafana, Alertmanager (kube-prometheus-stack)
- **Database**: CloudNativePG (PostgreSQL operator)
- **Security**: HashiCorp Vault, Cert-Manager, Kyverno

## Repository Structure

```
HomeLab/
├── ansible/      # OS configuration and Kubernetes setup
├── gitops/       # Kubernetes manifests deployed via ArgoCD
├── proxmox/      # Terraform — VM provisioning
├── vault/        # Terraform — secrets management
└── authentik/    # Terraform — identity provider
```
