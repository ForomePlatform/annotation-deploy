data "ibm_is_image" "ubuntu" {
  name = "ibm-ubuntu-20-04-3-minimal-amd64-2"
}
data "template_file" "user_data" {
  template = file("${path.module}/scripts/cloud-init.yml")
  vars = {
    var_disk_name = var.var_disk_name
    data_disk_name = var.data_disk_name
    user_name = var.user_name
    ssh_public_key = var.ssh_public_key
  }
}
resource "ibm_is_floating_ip" "fip" {
  name           = "${var.basename}-${var.instance_name}"
  resource_group = var.resource_group
  target         = ibm_is_instance.vsi.primary_network_interface[0].id
}
resource "ibm_is_volume" "var" {
  name           = "${var.basename}-${var.instance_name}-var-${var.var_volume_capacity}gb"
  resource_group = var.resource_group
  zone           = var.zone
  profile        = var.var_volume_profile
  capacity       = var.var_volume_capacity
}
resource "ibm_is_volume" "data" {
  name           = "${var.basename}-${var.instance_name}-data-${var.data_volume_capacity}gb"
  resource_group = var.resource_group
  zone           = var.zone
  profile        = var.data_volume_profile
  capacity       = var.data_volume_capacity
}
resource "ibm_is_instance" "vsi" {
  name           = "${var.basename}-${var.instance_name}"
  resource_group = var.resource_group
  vpc            = var.vpc
  zone           = var.zone
  profile        = var.instance_profile
  keys           = [var.ssh_key_id]
  # keys           = "r006-73991cdb-0ea3-4a3a-8dbb-9a2b89e5204c"
  image          = data.ibm_is_image.ubuntu.id
  user_data      = data.template_file.user_data.rendered
  lifecycle {
    ignore_changes = [ user_data ]
  }
  boot_volume {
    name         = "${var.basename}-${var.instance_name}-boot"
  }
  volumes = [
    ibm_is_volume.var.id,
    ibm_is_volume.data.id
    ]
  primary_network_interface {
    name            = "eth0"
    subnet          = var.subnet
    security_groups = [var.security_group]
  }
}