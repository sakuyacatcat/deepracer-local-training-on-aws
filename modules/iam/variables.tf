variable "role_name" {
  description = "Name of the IAM role"
  type        = string
  default     = "deepracer-ec2-role"
}

variable "instance_profile_name" {
  description = "Name of the IAM instance profile"
  type        = string
  default     = "deepracer-instance-profile"
}
