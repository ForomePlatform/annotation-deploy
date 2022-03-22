locals {
  ssh_public_key = file(pathexpand("${var.ssh_public_key_file}"))
  ssh_public_key_file = pathexpand("${var.ssh_public_key_file}")
  ssh_private_key_file = pathexpand("${var.ssh_private_key_file}")
}
module "cos" {
  source = "./modules/cos"
  basename = var.basename
  region = var.region
  resource_group = "asset-forome"
  resource_instance = "asset-forome"
}
module "ssh" {
  source = "./modules/ssh"
  basename = var.basename
  region = var.region
  resource_group = var.resource_group
  ssh_public_key = local.ssh_public_key
}
module "vsi" {
  source = "./modules/vsi"
  basename = var.basename
  region = var.region
  zone = var.zone
  vpc = var.vpc
  subnet= var.subnet
  security_group = var.security_group
  resource_group = var.resource_group
  instance_name = var.instance_name
  instance_profile = var.instance_profile
  volume_profile = var.volume_profile
  volume_capacity = var.volume_capacity
  ssh_key_id = module.ssh.id
  ssh_public_key_file = local.ssh_public_key_file
  ssh_public_key = local.ssh_public_key
  user_name = var.user_name
  disk_name = var.disk_name
}
resource "local_file" "ansible_inventory" {
  content = templatefile("inventory.tpl",
    {
      basename = var.basename
      instance_name = module.vsi.instance_name
      instance_ext_ip = module.vsi.instance_ext_ip
      user_name = var.user_name
      public_key = local.ssh_public_key
      ssh_private_key_file = local.ssh_private_key_file
    }
  )
  filename = "inventory"
}