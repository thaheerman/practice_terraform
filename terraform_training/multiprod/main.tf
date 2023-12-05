provider "aws" {
  region = "us-east-1"
  alias  = "nverginia"
}

provider "aws" {
  region = "ap-south-1"
}

provider "aws" {
  region = "us-east-2"
  alias  = "ohio"
}
resource "aws_s3_bucket" "test1" {
  bucket = "monk-1"
}

resource "aws_s3_bucket" "test2" {
  bucket   = "monk-2"
  provider = aws.nverginia
}

resource "aws_instance" "test3" {
  ami           = "ami-06d4b7182ac3480fa"
  instance_type = "t2.micro"
  provider      = aws.ohio
  tags = {
    Name = "memo"
  }
}

  