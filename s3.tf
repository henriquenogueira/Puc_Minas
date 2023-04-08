resource "aws_s3_bucket" "files" {
  bucket = var.s3_name
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.files.id
  acl    = var.bucket_acl
}

resource "aws_s3_bucket_versioning" "versioning_files" {
  bucket = aws_s3_bucket.files.id
  versioning_configuration {
    status = "Enabled"
  }
}