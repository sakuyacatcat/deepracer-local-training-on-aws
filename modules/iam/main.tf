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

# S3へのフルアクセス
resource "aws_iam_policy_attachment" "s3_access" {
  name       = "s3-full-access"
  roles      = [aws_iam_role.deepracer_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

# SSMへのアクセス（SSMエージェント）
resource "aws_iam_policy_attachment" "ssm_access" {
  name       = "ssm-access"
  roles      = [aws_iam_role.deepracer_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

# VPCの読み取り専用アクセス
resource "aws_iam_policy_attachment" "vpc_readonly_access" {
  name       = "vpc-read-only-access"
  roles      = [aws_iam_role.deepracer_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonVPCReadOnlyAccess"
}

# CloudWatchへのアクセス
resource "aws_iam_policy_attachment" "cloudwatch_access" {
  name       = "cloudwatch-access"
  roles      = [aws_iam_role.deepracer_role.name]
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchFullAccess"
}

# IAMインスタンスプロファイル
resource "aws_iam_instance_profile" "instance_profile" {
  name = var.instance_profile_name
  role = aws_iam_role.deepracer_role.name
}
