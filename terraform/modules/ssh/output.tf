output "id" {
  value = data.ibm_is_ssh_key.ssh_public_key.id
}
output "ibm_cloud_url" {
  value = data.ibm_is_ssh_key.ssh_public_key.resource_controller_url
}
output "public_key" {
  value = data.ibm_is_ssh_key.ssh_public_key.public_key
}
