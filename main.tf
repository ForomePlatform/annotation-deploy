module "cos" {
  source = "./modules/cos"
  region = var.region
  basename = var.basename
  resource_group = "asset-forome"
  resource_instance = "asset-forome"
}
module "ssh" {
  source = "./modules/ssh"
  region = var.region
  resource_group = var.resource_group
  basename = var.basename
  ssh_key_name = var.ssh_key_name
  ssh_key_public_file = var.ssh_key_public_file
}
module "vsi" {
  source = "./modules/vsi"
  region = var.region
  zone = var.zone
  vpc = var.vpc
  subnet= var.subnet
  security_group = var.security_group
  resource_group = var.resource_group
  ssh_key_id = module.ssh.id
  basename = var.basename
  instance_name = var.instance_name
  instance_profile = var.instance_profile
  volume_profile = var.volume_profile
  volume_capacity = var.volume_capacity
  user_name = var.user_name
  disk_name = var.disk_name
}