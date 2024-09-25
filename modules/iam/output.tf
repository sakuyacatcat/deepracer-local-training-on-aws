output "iam_role_name" {
  description = "Name of the IAM role"
  value       = aws_iam_role.deepracer_role.name
}

output "iam_instance_profile" {
  description = "Name of the IAM instance profile"
  value       = aws_iam_instance_profile.instance_profile.name
}
