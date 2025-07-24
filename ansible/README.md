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

## Configuration

This project uses environment variables to securely provide Proxmox API credentials to the dynamic inventory plugin.

1. Copy the example environment file:

```bash
cp .env.example .env
```

2. Edit `.env` and fill in your own Proxmox API details

3. Load the environment variables before using Ansible:

```bash
export $(cat .env | xargs)
```