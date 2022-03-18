data "ibm_resource_group" "cos_group" {
  name = "asset-forome"
}

data "ibm_resource_instance" "cos_instance" {
  name              = "asset-forome"
  service           = "cloud-object-storage"
  resource_group_id = data.ibm_resource_group.cos_group.id
}

resource "ibm_resource_key" "cos_key" {
  name                 = "${var.basename}-cos-terraform"
  resource_instance_id = data.ibm_resource_instance.cos_instance.id
  parameters           = { "HMAC" = true }
  role                 = "Writer"
}

# a bucket
resource "ibm_cos_bucket" "bucket" {
  bucket_name          = "${var.basename}-terraform"
  resource_instance_id = data.ibm_resource_instance.cos_instance.id
  region_location      = var.region
  storage_class        = "smart"
}