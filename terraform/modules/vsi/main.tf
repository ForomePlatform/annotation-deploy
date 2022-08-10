data "ibm_is_image" "ubuntu" {
  name = "ibm-ubuntu-20-04-3-minimal-amd64-2"
}
data "template_file" "user_data" {
  template = file("${path.module}/user_data/cloud-init.yml")
  vars = {
    data_disk_name = var.data_disk_name
    user_name = var.user_name
    ssh_public_key = var.ssh_public_key
  }
}
# resource "ibm_is_floating_ip" "fip" {
#   name           = "${var.instance_name}-${var.basename}"
#   resource_group = var.resource_group
#   target         = ibm_is_instance.vsi.primary_network_interface[0].id
# }
resource "ibm_is_volume" "data" {
  name           = "${var.basename}-data"
  resource_group = var.resource_group
  zone           = var.zone
  profile        = var.data_volume_profile
  capacity       = var.data_volume_capacity
  tags           = var.tags
}
resource "ibm_is_instance" "vsi" {
  name           = var.basename
  resource_group = var.resource_group
  vpc            = var.vpc
  zone           = var.zone
  profile        = var.instance_profile
  keys           = [ var.ssh_key_id ]
  image          = data.ibm_is_image.ubuntu.id
  user_data      = data.template_file.user_data.rendered
  volumes        = [ ibm_is_volume.data.id ]
  tags           = var.tags
  lifecycle {
    ignore_changes = [ user_data ]
  }
  boot_volume {
    name         = "${var.basename}-boot"
  }
  primary_network_interface {
    name            = "eth0"
    subnet          = var.subnet
    security_groups = var.security_groups
  }
}
