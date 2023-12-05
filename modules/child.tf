module "ec2_child" {
  source   = "./root"
  ami_id   = "ami-02a2af70a66af6dfb"
  ec2_type = "t2.micro"

}