resource "aws_s3_bucket" "tf1_s3" {
  bucket = "da-tf1-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
