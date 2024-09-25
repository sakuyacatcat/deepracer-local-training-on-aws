variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "deepracer-vpc"
}

variable "subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "subnet_name" {
  description = "Name of the public subnet"
  type        = string
  default     = "deepracer-subnet"
}

variable "allowed_ip" {
  description = "IP address or CIDR block allowed to access resources"
  type        = string
  default     = "0.0.0.0/0"
}
