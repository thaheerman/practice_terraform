variable "ami_id" {
  type    = string
  default = ""
}
variable "ec2_type" {
  type = map(string)
  default = {
    "dev" = "t2.micro"
    "prod" = "t2.nano"
  }
  
}
#variable "ec2_type" {
#  type    = string
 # default = ""
#}
variable "ec2_az" {
  type    = string
  default = ""
}
variable "key" {
  type    = string
  default = ""

}