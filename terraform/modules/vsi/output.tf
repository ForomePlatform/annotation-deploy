output "instance_name" {
  value = ibm_is_instance.vsi.name
}
output "instance_profile" {
  value = ibm_is_instance.vsi.profile
}
output "instance_ext_ip" {
  value = ibm_is_floating_ip.fip.address
}
# output "var_volume_profile" {
#   value = ibm_is_volume.var.profile
# }
# output "var_volume_capacity" {
#   value = ibm_is_volume.var.capacity
# }
output "data_volume_profile" {
  value = ibm_is_volume.data.profile
}
output "data_volume_capacity" {
  value = ibm_is_volume.data.capacity
}