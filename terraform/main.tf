locals {
  ssh_public_key = file(pathexpand("${var.ssh_public_key_file}"))
  ssh_public_key_file = pathexpand("${var.ssh_public_key_file}")
  ssh_private_key_file = pathexpand("${var.ssh_private_key_file}")
  basename = "${terraform.workspace}"
}
module "fip" {
  source = "./modules/fip"
  ibmcloud_api_key = var.ibmcloud_api_key
  basename = local.basename
  region = var.region
  instance_name = var.instance_name
  resource_group = var.resource_group
  instance_intf = module.vsi.instance_intf
  tags = var.tags
}
module "ssh" {
  source = "./modules/ssh"
  ibmcloud_api_key = var.ibmcloud_api_key
  basename = local.basename
  instance_name = var.instance_name
  region = var.region
  resource_group = var.resource_group
  ssh_key_name = var.ssh_key_name
  ssh_public_key = local.ssh_public_key
}
module "vsi" {
  source = "./modules/vsi"
  ibmcloud_api_key = var.ibmcloud_api_key
  basename = local.basename
  region = var.region
  zone = var.zone
  vpc = var.vpc
  subnet= var.subnet
  security_groups = var.security_groups
  resource_group = var.resource_group
  instance_name = var.instance_name
  instance_profile = var.instance_profile
  data_disk_name = var.data_disk_name
  data_volume_profile = var.data_volume_profile
  data_volume_capacity = var.data_volume_capacity
  ssh_key_id = module.ssh.id
  ssh_public_key_file = local.ssh_public_key_file
  ssh_public_key = local.ssh_public_key
  user_name = var.user_name
  tags = var.tags
}
resource "local_file" "ansible_inventory" {
  depends_on = [
    module.ssh.ibm_is_ssh_key,
    module.vsi.ibm_is_volume,
    module.vsi.ibm_is_instance,
    module.fip.ibm_is_floating_ip
    # module.vsi.ibm_is_floating_ip
  ]
  content = templatefile("../ansible/inventory.tpl",
    {
      basename = local.basename
      instance_name = module.vsi.instance_name
      # instance_ext_ip = module.vsi.instance_ext_ip
      instance_ext_ip = module.fip.instance_ext_ip
      user_name = var.user_name
      public_key = local.ssh_public_key
      ssh_private_key_file = local.ssh_private_key_file
    }
  )
  filename = "../ansible/inventory_${local.basename}"
}
# resource "null_resource" "ansible_playbook" {
#   depends_on = [
#     module.ssh.ibm_is_ssh_key,
#     module.vsi.ibm_is_volume,
#     module.vsi.ibm_is_instance,
#     module.vsi.ibm_is_floating_ip,
#     local_file.ansible_inventory
#   ]
#   # triggers = {
#   #   always_run = timestamp()
#   # }
#   provisioner "local-exec" {
#     interpreter = ["bash", "-c"]
#     command = "cd ansible && ansible-playbook main.yml --inventory=${local_file.ansible_inventory.filename}"
#   }
# }
terraform {
  backend "azurerm" {
    resource_group_name  = "prj-forome"
    storage_account_name = "forome"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}