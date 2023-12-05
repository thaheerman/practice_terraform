terraform {
  backend "s3" {
    encrypt = true
    bucket  = "monk-2"
    key     = "terraform.tfstate"
    region  = "us-east-1"
    tags = {
      Name = "bhai_vpc"
    }
  }
} 