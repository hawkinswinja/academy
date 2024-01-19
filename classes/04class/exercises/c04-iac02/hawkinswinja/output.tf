output "vpc-cidr" {
   value = aws_vpc.main.cidr_block
}

output "public-cidr" {
  value = aws_subnet.public[*].cidr_block
}
/*
output "public2-cidr" {
  value = aws_subnet.public2.cidr_block
}

output "private1-cidr" {
  value = aws_subnet.private1.cidr_block
}
*/
output "private-cidr" {
  value = aws_subnet.private[*].cidr_block
}
