variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "dev-deepracer-bucket"
}

variable "key_name" {
  description = "The name of the EC2 key pair"
  type        = string
}
