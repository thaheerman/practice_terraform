resource "aws_vpc" "my-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "test-vpc"
  }
}
resource "aws_s3_bucket" "buck-1" {
  bucket = "man-2"
}

resource "aws_dynamodb_table" "file-lock" {
  name         = "Terraformstatelock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Name = "terraform-state-lock-file"
  }

}