# Proxmox Terraform Project

To use this Terraform project with the Proxmox Virtual Environment (PVE), you need to set up API token authentication.

## Required Environment Variable

Before running Terraform, export your Proxmox API token:

```bash
export PROXMOX_VE_API_TOKEN='terraform@pve!provider=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx'
```

## Creating the Terraform User with API Token Access

You must create a `terraform@pve` user with an API token and appropriate permissions. You can run the following commands on your Proxmox host:

```bash
sudo pveum user add terraform@pve

sudo pveum role add Terraform -privs "Mapping.Audit Mapping.Modify Mapping.Use Permissions.Modify Pool.Allocate Pool.Audit Realm.AllocateUser Realm.Allocate SDN.Allocate SDN.Audit Sys.Audit Sys.Console Sys.Incoming Sys.Modify Sys.AccessNetwork Sys.PowerMgmt Sys.Syslog User.Modify Group.Allocate SDN.Use VM.Allocate VM.Audit VM.Backup VM.Clone VM.Config.CDROM VM.Config.CPU VM.Config.Cloudinit VM.Config.Disk VM.Config.HWType VM.Config.Memory VM.Config.Network VM.Config.Options VM.Console VM.Migrate VM.Monitor VM.PowerMgmt VM.Snapshot.Rollback VM.Snapshot Datastore.Allocate Datastore.AllocateSpace Datastore.AllocateTemplate Datastore.Audit"

sudo pveum aclmod / -user terraform@pve -role Terraform

sudo pveum user token add terraform@pve provider --privsep=0
```

For more details, refer to the official documentation:

https://registry.terraform.io/providers/bpg/proxmox/latest/docs#api-token-authentication

## Proxmox Storage Configuration

Make sure the Proxmox storage you use (e.g., local) is configured to allow:
- Import (for downloading .qcow2 images)
- Snippets (for uploading cloud-init files)

To enable this:
1. In the Proxmox web UI, go to Datacenter → Storage → local → Edit.
2. Under Content, check the boxes for:
    - Import
    - Snippets
3. Save the configuration.
