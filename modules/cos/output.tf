output "resource_group" {
  value = data.ibm_resource_group.cos_group
}
output "resource_group_id" {
  value = data.ibm_resource_group.cos_group.id
}
output "resource_instance" {
  value = data.ibm_resource_instance.cos_instance
}
output "resource_instance_id" {
  value = data.ibm_resource_instance.cos_instance.resource_group_id
}
output "access_key_id" {
  value = ibm_resource_key.cos_key.credentials["cos_hmac_keys.access_key_id"]
}
output "secret_access_key" {
  value = ibm_resource_key.cos_key.credentials["cos_hmac_keys.secret_access_key"]
}
# output "bucket_name" {
#   value = ibm_cos_bucket.bucket.bucket_name
# }