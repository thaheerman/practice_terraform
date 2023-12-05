resource "aws_instance" "my_ec2" {
  ami                         = var.ami_id
 # instance_type               = var.ec2_type
  instance_type = lookup(var.ec2_type,terraform.workspace)
  associate_public_ip_address = true
  availability_zone           = var.ec2_az
  key_name                    = var.key
  tags = {
    Name = "test_0"
  }

}