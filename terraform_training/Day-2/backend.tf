terraform {
  backend "s3" {
    bucket = var.bucket
    key    = var.keyname
    region = var.reg

  }
}