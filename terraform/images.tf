resource "proxmox_virtual_environment_download_file" "debian_12_genericcloud_amd64_qcow2" {
  content_type       = "import"
  datastore_id       = "local"
  file_name          = "debian-12-genericcloud-amd64.qcow2"
  node_name          = "pve"
  url                = "https://cloud.debian.org/images/cloud/bookworm/latest/debian-12-genericcloud-amd64.qcow2"
  checksum           = "da702efced2cd98017790d0e00fee81f1e1404d3f990a4741f52e6f18bde9856d37799c053b3baa48805048a595d2a6a13c41b8287ec6f76ec27b7ef1b67a215"
  checksum_algorithm = "sha512"
}
