# Proxmox Ansible Project

This repository provides a personal Ansible project structure for managing a homelab infrastructure using Proxmox VE. It is organized to support dynamic inventory, roles, and playbooks for automating VM/container provisioning and service deployment.

## Requirements

### System

- Python 3.8+
- Ansible 2.14+
- Access to a Proxmox cluster with an API token

### Python Environment

Make sure you have the required Python packages installed:

```bash
pip install requests
ansible-galaxy collection install community.general
```

## Inventory & Vault

This project uses the Proxmox dynamic inventory plugin and secures all connection details using Ansible Vault.

### Encrypted Inventory

The `inventory/inventory.proxmox.yml` file is entirely encrypted using Ansible Vault. It contains the plugin configuration and authentication data.

Example content (before encryption):

```yaml
plugin: community.proxmox.proxmox

url: https://proxmox.local
user: user@pve
node: proxmox
token_id: mytoken
token_secret: xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx

validate_certs: false
want_facts: true

keyed_groups:
  - key: proxmox_tags_parsed
    separator: ""

compose:
  ansible_host: proxmox_agent_interfaces[1]["ip-addresses"][0].split('/')[0]
```

This file allows Ansible to dynamically query your Proxmox cluster and group hosts based on tags, while also extracting their primary IP addresses for use as `ansible_host`.

To edit it:

```bash
ansible-vault edit inventory/inventory.proxmox.yml
```

## How to Use

1. Provide Vault password
You can either:
 - Use --ask-vault-pass
 - Or store it in a secure local file (e.g. ~/.vault_pass.txt):

```bash
echo 'your_vault_password' > ~/.vault_pass.txt
chmod 600 ~/.vault_pass.txt
```

2. List inventory

```bash
ansible-inventory -i inventory/inventory.proxmox.yml --vault-password-file ~/.vault_pass.txt --list
```

3. Run playbooks

```bash
ansible-playbook -i inventory/inventory.proxmox.yml playbooks/your_playbook.yml --vault-password-file ~/.vault_pass.txt
```
