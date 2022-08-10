data "ibm_is_ssh_key" "ssh_public_key" {
  name = var.ssh_key_name
  resource_group = var.resource_group
}
