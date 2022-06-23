resource "ibm_is_floating_ip" "fip" {
  name           = var.basename
  resource_group = var.resource_group
  target         = var.instance_intf
  tags           = var.tags
    lifecycle {
      # prevent_destroy = true
      create_before_destroy = true
      ignore_changes = [ tags ]
    }
}