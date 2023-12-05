data "aws_ami" "amz_lin" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-gp2"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

}
resource "aws_instance" "my_ec2" {
  ami                         = data.aws_ami.amz_lin.id
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  key_name                    = "now"
  subnet_id                   = aws_subnet.my_sub.id
  security_groups             = [aws_security_group.pub_sg.id]
  availability_zone           = "ap-south-1a"
  count = 2
  user_data                   = file("http.sh")
  tags = {
    name = "pub_ins_myvpc-${count.index}"
  }
  lifecycle {
    ignore_changes = [ tags, ]
  }
  lifecycle {
    prevent_destroy = false
  }
  lifecycle {
    create_before_destroy = false
  }
}
resource "aws_ebs_volume" "my_ebs" {
  availability_zone = "ap-south-1a"
  size              = 8
  tags = {
    Name = "ebs_myvpc_add"
  }
}
resource "aws_volume_attachment" "vol_attach" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.my_ebs.id
  instance_id = aws_instance.my_ec2.id

}
resource "aws_dynamodb_table" "lock_file" {
  name         = "Terraformstatelock"  
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Name = "Terraform_Lock_state_file"
  }

}