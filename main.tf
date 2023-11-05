# Creating s3 bucket
resource "aws_s3_bucket" "mybucket" {
  bucket = var.bucket

  tags = {
    Name        = "Static-Website"
    Environment = "Dev"
  }
}

#uploading index.html to bucket
resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.mybucket.id
  key          = "index.html"
  source       = "index.html"
  acl          = "public-read"
  content_type = "text/html"
  depends_on = [ aws_s3_bucket_public_access_block.accessblock ]
}

#uploading error.html to bucket
resource "aws_s3_object" "error" {
  bucket       = aws_s3_bucket.mybucket.id
  key          = "error.html"
  source       = "error.html"
  acl          = "public-read"
  content_type = "text/html"
  depends_on = [ aws_s3_bucket_public_access_block.accessblock ]
}

#uploading image to bucket
resource "aws_s3_object" "image" {
  bucket = aws_s3_bucket.mybucket.id
  key    = "profile.jpg"
  source = "profile.jpg"
  acl    = "public-read"
  depends_on = [ aws_s3_bucket_public_access_block.accessblock ]
}

resource "aws_s3_bucket_public_access_block" "accessblock" {

  bucket = aws_s3_bucket.mybucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}


# Ownership of the bucket
resource "aws_s3_bucket_ownership_controls" "bucketowner" {
  bucket = aws_s3_bucket.mybucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# To expose bucket objects become publicly accessible.
resource "aws_s3_bucket_acl" "aclcontrol" {
  depends_on = [aws_s3_bucket_ownership_controls.bucketowner,
    aws_s3_bucket_public_access_block.accessblock
  ]

  bucket = aws_s3_bucket.mybucket.id
  acl    = "public-read"
}

# Static Website configuration
resource "aws_s3_bucket_website_configuration" "myportfoliowebsite" {
  bucket = aws_s3_bucket.mybucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  depends_on = [aws_s3_bucket_acl.aclcontrol]
}