data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "main" {
  bucket = "${data.aws_caller_identity.current.account_id}.${var.bucket_name}"
}

resource "aws_s3_object" "main" {
  provider = aws.secondary

  bucket  = aws_s3_bucket.main.id
  key     = var.object_key
  content = var.object_content
  content_type = "application/json"
}
