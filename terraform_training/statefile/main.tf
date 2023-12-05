resource "aws_vpc" "mand" {
  cidr_block = "10.0.0.0/16"
}
resource "aws_instance" "mod" {
  ami           = "ami-02a2af70a66af6dfb"
  instance_type = "t2.micro"
  tags = {
    Name = "mode"
  }
}