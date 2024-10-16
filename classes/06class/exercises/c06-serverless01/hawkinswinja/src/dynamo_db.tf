resource "aws_dynamodb_table" "customers" {
  name         = var.db_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"
  server_side_encryption {
    enabled = true
  }
  attribute {
    name = "id"
    type = "S"
  }
  tags = {
    Name = "customers"
  }

}