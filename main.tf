provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test123"
  secret_key                  = "testabc"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true

  endpoints {
    s3 = "http://s3.localhost.localstack.cloud:4566"
  }
}

resource "aws_s3_bucket" "bucket_terraform" {
  bucket = "bucket-terraform"

  # acl    = "public-read"
}

resource "aws_s3_bucket_ownership_controls" "create" {
  bucket = aws_s3_bucket.bucket_terraform.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
resource "aws_s3_bucket_public_access_block" "create" {
  bucket = aws_s3_bucket.create.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "create" {
  depends_on = [
    aws_s3_bucket_ownership_controls.create,
    aws_s3_bucket_public_access_block.create,
  ]

  bucket = aws_s3_bucket.bucket_terraform.id
  acl    = "public-read"
}
