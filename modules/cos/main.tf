# data "ibm_resource_group" "cos_group" {
#   name = var.resource_group
# }
# data "ibm_resource_instance" "cos_instance" {
#   name              = var.resource_instance
#   service           = "cloud-object-storage"
#   resource_group_id = data.ibm_resource_group.cos_group.id
# }
# resource "ibm_resource_key" "cos_key" {
#   name                 = "${var.basename}-terraform-cos"
#   resource_instance_id = data.ibm_resource_instance.cos_instance.id
#   parameters           = { "HMAC" = true }
#   role                 = "Writer"
# }
# resource "ibm_cos_bucket" "bucket" {
#   bucket_name          = "${var.basename}-terraform"
#   resource_instance_id = data.ibm_resource_instance.cos_instance.id
#   region_location      = var.region
#   storage_class        = "smart"
# }