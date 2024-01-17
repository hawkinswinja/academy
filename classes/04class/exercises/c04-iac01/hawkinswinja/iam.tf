resource "aws_iam_role" "tf1_role" {
  name               = "instance_role"
  path               = "/system/"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy" "test_policy" {
  name = "test_policy"
  role = aws_iam_role.tf1_role.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Effect": "Allow",
        "Action": [
          "s3:List*",
          "s3:Get*"
        ],
        "Resource": aws_s3_bucket.tf1_s3.arn
      }
    ]
  })
}

resource "aws_iam_instance_profile" "s3_profile" {
  name = "tf1_profile"
  role = aws_iam_role.tf1_role.name
}
