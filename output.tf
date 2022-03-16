output "instance_name" {
   value = module.vsi.instance_name
}
output "instance_profile" {
   value = module.vsi.instance_profile
}
output "instance_ext_ip" {
   value = module.vsi.instance_ext_ip
}
output "volume_profile" {
  value = module.vsi.volume_profile
}
output "volume_capacity" {
  value = module.vsi.volume_capacity
}
output "ssh_key_public_file" {
  value = var.ssh_key_public_file
}