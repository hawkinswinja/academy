resource "aws_api_gateway_rest_api" "MyDemoAPI" {
  name        = "da-serverless-api"
  description = "This is my API Key for serverless demo"
}

resource "aws_api_gateway_api_key" "example" {
  name = "da-serverless-api-key"
}

resource "aws_lambda_permission" "lambda_permission" {
  statement_id  = "AllowAPIGateWayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.da_serverless_lambda.function_name
  principal     = "apigateway.amazonaws.com"

  # The /* part allows invocation from any stage, method and resource path
  # within API Gateway.
  source_arn = "${aws_api_gateway_rest_api.MyDemoAPI.execution_arn}/*"
}

resource "aws_api_gateway_resource" "customers" {
  rest_api_id = aws_api_gateway_rest_api.MyDemoAPI.id
  parent_id   = aws_api_gateway_rest_api.MyDemoAPI.root_resource_id
  path_part   = "customers"

}

resource "aws_api_gateway_method" "post_customers" {
  rest_api_id      = aws_api_gateway_rest_api.MyDemoAPI.id
  resource_id      = aws_api_gateway_resource.customers.id
  http_method      = "POST"
  api_key_required = true
  authorization    = "NONE"
}

resource "aws_api_gateway_integration" "post_customers" {
  rest_api_id             = aws_api_gateway_rest_api.MyDemoAPI.id
  resource_id             = aws_api_gateway_resource.customers.id
  http_method             = aws_api_gateway_method.post_customers.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.da_serverless_lambda.invoke_arn

}

resource "aws_api_gateway_deployment" "MyDemoAPI" {
  rest_api_id = aws_api_gateway_rest_api.MyDemoAPI.id

  triggers = {
    redeployment = sha1(jsonencode([
      aws_api_gateway_resource.customers,
      aws_api_gateway_method.post_customers,
      aws_api_gateway_integration.post_customers,
    ]))
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "dev" {
  deployment_id = aws_api_gateway_deployment.MyDemoAPI.id
  rest_api_id   = aws_api_gateway_rest_api.MyDemoAPI.id
  stage_name    = "dev"
}

resource "aws_api_gateway_usage_plan" "myusageplan" {
  name = "serveless_usage_plan"

  api_stages {
    api_id = aws_api_gateway_rest_api.MyDemoAPI.id
    stage  = aws_api_gateway_stage.dev.stage_name
  }
}

resource "aws_api_gateway_usage_plan_key" "main" {
  key_id        = aws_api_gateway_api_key.example.id
  key_type      = "API_KEY"
  usage_plan_id = aws_api_gateway_usage_plan.myusageplan.id
}