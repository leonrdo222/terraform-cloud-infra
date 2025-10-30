variable "name" {
  description = "Name of the security group"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where security group will be created"
  type        = string
}

variable "ssh_allowed_cidr" {
  description = "CIDR block allowed to SSH into instances"
  type        = string
}