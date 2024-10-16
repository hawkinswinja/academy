variable "db_name" {
  type    = string
  default = "DA_Serverless"
}

resource "aws_ssm_parameter" "da_serverless" {
  for_each = tomap({
    db_name = var.db_name,
    api_key = aws_api_gateway_api_key.example.id
  })
  name  = each.key
  type  = "SecureString"
  value = each.value
}

#api gateway configuration: api-gateway.tf
#dynamodb configuration: dynamodb.tf
#lambda configuration: lambda.tf
#iam policy configuration: iam.tf