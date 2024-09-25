resource "aws_iam_role" "deepracer_role" {
  name = var.role_name

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      }
    }
  ]
}
EOF
}

resource "aws_iam_policy_attachment" "s3_access" {
  name       = "s3-full-access"
  roles      = [aws_iam_role.deepracer_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_policy_attachment" "ssm_access" {
  name       = "ssm-access"
  roles      = [aws_iam_role.deepracer_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "instance_profile" {
  name = var.instance_profile_name
  role = aws_iam_role.deepracer_role.name
}
