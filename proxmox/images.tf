resource "proxmox_virtual_environment_download_file" "debian_13_genericcloud_amd64_qcow2" {
  content_type = "import"
  datastore_id = "local"
  file_name    = "debian-13-genericcloud-amd64.qcow2"
  node_name    = "pve"
  url          = "https://cloud.debian.org/images/cloud/trixie/latest/debian-13-genericcloud-amd64.qcow2"
}
