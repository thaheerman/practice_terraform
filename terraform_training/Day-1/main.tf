terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.26.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

resource "aws_s3_bucket" "buck" {
  bucket = var.mybuck1
}

resource "aws_instance" "test" {
  ami           = var.myami
  instance_type = var.ec2_type
  tags = {
    Name = "demo"
  }
}

resource "aws_vpc" "main" {
  cidr_block       = var.cidr
  instance_tenancy = var.tenancy
  tags = {
    Name = "demo_vpc"
  }
}
