
resource "aws_lambda_function" "da_serverless_lambda" {
  function_name    = "da_serverless_lambda"
  filename         = "lambda.zip"
  role             = aws_iam_role.lambda_role.arn
  handler          = "lambda_handler.lambda_handler"
  runtime          = "python3.12"
  source_code_hash = filebase64sha256("lambda.zip")
  environment {
    variables = {
      DB_NAME = aws_ssm_parameter.da_serverless["db_name"].value
    }
  }

  logging_config {
    log_group  = aws_cloudwatch_log_group.example.name
    log_format = "Text"
  }

  depends_on = [aws_dynamodb_table.customers]
}

resource "aws_cloudwatch_log_group" "example" {
  name              = "/da-serverless-lambda"
  retention_in_days = 1
}

