# Create the target S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name

  force_destroy = true
}

resource "aws_s3_bucket_object" "object" {
  bucket = aws_s3_bucket.my_bucket
  key    = "/daily/paylad.json"
  source = data.http.example.body

}
data "http" "example" {
  url = var.url

  # Optional request headers
  request_headers = {
    Accept = "application/json"
  }
}