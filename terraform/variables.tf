variable "ibmcloud_api_key" {
  description = "ibmcloud_api_key"
  type = string
  nullable = false
}
variable "region" {
  description = "us-south"
  default = "us-south"
}
variable "zone" {
  description = "us-south-2"
  default = "us-south-2"
}
variable "resource_group" {
  description = "asset-forome"
  default = "36431c4040924be6bad4306be499b281"
}
variable "vpc" {
  description = "asset-forome"
  default = "r006-e36038c9-4c39-4897-a3c7-ee925ef15430"
}
variable "subnet" {
  description = "sn-20220204-02"
  default = "0727-bea5643c-ddf6-4405-8c87-31a8c7642f8a"
}
variable "security_group" {
  description = "anything-swab-grass-aide"
  default = "r006-232af301-0d00-4d1e-98be-d37427e83cce"
}
variable "instance_name" {
  default = "annotation"
}
variable "instance_profile" {
  default = "bx2-2x8"
}
variable "user_name" {
  default = "forome"
}
variable "data_disk_name" {
  default = "/dev/vdd"
}
variable "data_volume_profile" {
  default = "general-purpose"
}
variable "data_volume_capacity" {
  default = "1000"
}
variable "ssh_key_name" {
  default = "forome-ssh"
}
variable "ssh_public_key_file" {
  default = ".ssh/forome-ssh.pub"
}
variable "ssh_private_key_file" {
  default = ".ssh/forome-ssh"
}
variable "tags" {
  type = list
  default = []
}