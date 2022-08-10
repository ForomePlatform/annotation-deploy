output "instance_name" {
  value = ibm_is_instance.vsi.name
}
output "instance_profile" {
  value = ibm_is_instance.vsi.profile
}
output "instance_intf" {
  value = ibm_is_instance.vsi.primary_network_interface[0].id
}
# output "instance_ext_ip" {
#   value = ibm_is_floating_ip.fip.address
# }
output "data_volume_profile" {
  value = ibm_is_volume.data.profile
}
output "data_volume_capacity" {
  value = ibm_is_volume.data.capacity
}
