data "aws_vpc" "main" {
  default = true
}

data "aws_subnets" "example" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.main.id]
  }
}

module "asg" {
  source = "./iac-04-module"
  vpc_id = data.aws_vpc.main.id
  ami = var.ami
  subnets = data.aws_subnets.example.ids
  asg-decrease = var.asg-d
  asg-increase = var.asg-i
}
