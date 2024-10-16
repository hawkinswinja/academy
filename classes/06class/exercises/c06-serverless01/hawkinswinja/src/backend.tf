terraform {
  backend "s3" {
    bucket         = "hawkinswinja-state"
    key            = "devops/au/c06-serverless01/hawkinswinja/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "statelock"
  }
}
