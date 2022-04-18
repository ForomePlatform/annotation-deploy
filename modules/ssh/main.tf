resource "ibm_is_ssh_key" "ssh_public_key" {
  lifecycle {
    ignore_changes = [ public_key ]
  }
  # name = "${var.basename}-terraform-ssh"
  name = "${var.basename}-${var.instance_name}-ssh"
  resource_group = var.resource_group
  public_key = var.ssh_public_key
}