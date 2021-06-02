resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = "my-tf-test-bucket-10"
  acl    = "public-read"

  tags = {
    Name        = "my-tf-test-bucket-10"
    Environment = "Dev"
  }
}