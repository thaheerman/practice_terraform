terraform {
  backend "s3" {
    encrypt = true
    bucket  = "man-1"
    key     = "terraform.tfstate"
    region  = "ap-south-1" 

  }
}