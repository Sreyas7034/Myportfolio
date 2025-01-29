provider "aws" {
  region = "eu-west-1"
}

locals {
  bucket_name = "sreyas_portfolio"
}

resource "aws_s3_bucket" "website_bucket" {
  bucket = local.bucket_name

  # Enable static website hosting
  website {
    index_document = "index.html"
    error_document = "404.html"
  }
}
resource "aws_s3_bucket_website_configuration" "website_config" {
  bucket = aws_s3_bucket.website_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "404.html"
  }
}
output "bucket_website_url" {
  value       = aws_s3_bucket.website_bucket.website_endpoint
  description = "The URL of the static website hosted on S3"
}
