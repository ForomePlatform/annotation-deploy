output "instance_name" {
  value = ibm_is_instance.vsi.name
}
output "instance_profile" {
  value = ibm_is_instance.vsi.profile
}
output "instance_ext_ip" {
  value = ibm_is_floating_ip.fip.address
}
output "volume_profile" {
  value = ibm_is_volume.vol.profile
}
output "volume_capacity" {
  value = ibm_is_volume.vol.capacity
}