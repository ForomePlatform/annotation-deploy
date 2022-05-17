output "instance_ext_ip" {
   value = module.fip.instance_ext_ip
}
output "user_name" {
  value = var.user_name
}
output "ssh_private_key_file" {
  value = local.ssh_private_key_file
}
output "ssh_command" {
  value = "ssh -i ${local.ssh_private_key_file} ${var.user_name}@${module.fip.instance_ext_ip}"
}