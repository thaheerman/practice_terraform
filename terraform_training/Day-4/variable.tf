
#volume_attachment details
variable "dev_nm" {
  type    = string
  default = "/dev/sdh"
}
variable "vol_id" {
  type    = string
  default = "aws_ebs_volume.my_ebs.id"
}
variable "ec2_id" {
  type    = string
  default = "aws_instance.my_ec2.id"
}
#dynamodb_table_lock_file details
variable "terra_lock_nm" {
  type    = string
  default = "Terraformstatelock"
}
variable "bill_mode" {
  type    = string
  default = "PAY_PER_REQUEST"
}
variable "hash_key_nm" {
  type    = string
  default = "LockID" 
}
