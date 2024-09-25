output "vpc_id" {
  description = "ID of the VPC"
  value       = module.network.vpc_id
}

output "subnet_id" {
  description = "ID of the subnet"
  value       = module.network.subnet_id
}

output "security_group_id" {
  description = "ID of the security group"
  value       = module.network.security_group_id
}

output "s3_bucket_name" {
  description = "Name of the S3 bucket"
  value       = module.s3.s3_bucket_name
}

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = module.ec2.instance_id
}

output "public_ip" {
  description = "Public IP of the EC2 instance"
  value       = module.ec2.public_ip
}
