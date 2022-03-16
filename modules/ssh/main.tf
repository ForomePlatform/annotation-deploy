locals {
  public_key = file(pathexpand(var.ssh_key_public_file))
}
resource "ibm_is_ssh_key" "ssh_public_key" {
  lifecycle {
    # create_before_destroy = true
    # prevent_destroy = true
    ignore_changes = all
  }
  name = var.ssh_key_name
  resource_group = var.resource_group
  public_key = local.public_key
}