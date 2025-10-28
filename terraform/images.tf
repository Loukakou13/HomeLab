resource "proxmox_virtual_environment_download_file" "debian_13_genericcloud_amd64_qcow2" {
  content_type       = "import"
  datastore_id       = "local"
  file_name          = "debian-13-genericcloud-amd64.qcow2"
  node_name          = "pve"
  url                = "https://cloud.debian.org/images/cloud/trixie/latest/debian-13-genericcloud-amd64.qcow2"
  checksum           = "aa1963a7356a7fab202e5eebc0c1954c4cbd4906e3d8e9bf993beb22e0a90cd7fe644bd5e0fb5ec4b9fbea16744c464fda34ef1be5c3532897787d16c7211f86"
  checksum_algorithm = "sha512"
}
