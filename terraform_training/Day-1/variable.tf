#S3_Bucket
variable "mybuck1" {
  type    = string
  default = ""
}

#EC2_Instance
variable "myami" {
  type    = string
  default = ""
}
variable "ec2_type" {
  type    = string
  default = ""
}

#VPC
variable "cidr" {
  type    = string
  default = ""
}
variable "tenancy" {
  type    = string
  default = ""
}