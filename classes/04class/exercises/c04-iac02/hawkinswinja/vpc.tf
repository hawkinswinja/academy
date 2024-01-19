data "aws_availability_zones" "available" {
  state = "available"
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

resource "aws_vpc" "main" {
  cidr_block       = var.vpc-cidr
  instance_tenancy = "default"

  tags = {
    Name = "devopsacademy-iac"
  }
}

resource "aws_subnet" "public" {
  count = "${length(var.public)}"
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public-cidr[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = var.public[count.index]
  }
}

resource "aws_subnet" "private" {
  count = "${length(var.private)}"
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private-cidr[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = var.private[count.index]
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "devopsacademy-iac-igw"
  }
}

resource "aws_route_table" "route-table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "devopsacademy-iac-rt"
  }
}

resource "aws_route_table_association" "rta" {
  count = "${length(var.public)}"
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.route-table.id
}

