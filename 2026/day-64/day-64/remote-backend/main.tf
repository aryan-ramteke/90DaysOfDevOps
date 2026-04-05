resource "aws_s3_bucket" "remote_bucket" {
  bucket = "terraweek-state-aaryan"
}

resource "aws_s3_bucket_versioning" "versioning_remote_bucket" {
  bucket = aws_s3_bucket.remote_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "remote_table" {
  name         = "terraweek-state-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}