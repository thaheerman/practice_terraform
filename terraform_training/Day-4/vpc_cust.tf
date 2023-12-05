#create vpc
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "myvpc"
  }
}
#create subnet
resource "aws_subnet" "my_sub" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "pub_sub_myvpc"
  }
}
#create igw
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "igw_myvpc"
  }
}
#create route table and route igw
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "pub_rt"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}
#route subnet to route table
resource "aws_route_table_association" "rt_assoc" {
  subnet_id      = aws_subnet.my_sub.id    
  route_table_id = aws_route_table.rt.id
}
#create security group
resource "aws_security_group" "pub_sg" {
  name        = "allow_Tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.my_vpc.id
  #inbound rule-1
  ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }
  #inbound rule-2 
  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  #outbound rule-1
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "pub_sg_myvpc"
  }
}
