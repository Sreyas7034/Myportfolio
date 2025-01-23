variable "files_path" {
  description = "Path to the website files directory"
  type        = string
  default     = "./website" # Update with the actual file directory
}

resource "aws_s3_object" "website_files" {
  for_each = fileset(var.files_path, "**")

  bucket = aws_s3_bucket.website_bucket.id
  key    = each.key
  source = "${var.files_path}/${each.key}"

  content_type = lookup(
    {
      "html"  = "text/html"
      "css"   = "text/css"
      "js"    = "application/javascript"
      "png"   = "image/png"
      "jpg"   = "image/jpeg"
      "jpeg"  = "image/jpeg"
      "json"  = "application/json"
      "map"   = "application/json" # For .map files
      "woff"  = "font/woff"
      "woff2" = "font/woff2"
      "ttf"   = "font/ttf"
      "otf"   = "font/otf"
    },
    regex("[^.]+$", each.key), # Correct regex to match file extensions
    "application/octet-stream" # Default MIME type
  )
}
