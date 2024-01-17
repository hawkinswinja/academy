resource "aws_instance" "tf1-ec2" {
  ami           = "ami-01128ea8b62b5930e"
  instance_type = "t2.micro"
  iam_instance_profile = aws_iam_instance_profile.s3_profile.name
  vpc_security_group_ids = [aws_security_group.da-tf1-sg.id]
  associate_public_ip_address = true
  key_name = "aws102"

  tags = {
    Name = "tf1-ec2"
  }
}

output "ec2_ip" {
  value = aws_instance.tf1-ec2.public_ip
}
