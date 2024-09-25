variable "ami" {
  description = "AMI ID to launch"
  type        = string
}

variable "instance_type" {
  description = "Type of instance to launch"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID to launch the instance in"
  type        = string
}

variable "security_group" {
  description = "Security group to associate with the instance"
  type        = string
}

variable "iam_instance_profile" {
  description = "IAM instance profile to associate with the instance"
  type        = string
}

variable "volume_size" {
  description = "Size of the root EBS volume"
  type        = number
  default     = 150
}

variable "tags" {
  description = "Tags to apply to the instance"
  type        = map(string)
}
