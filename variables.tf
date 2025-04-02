variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "subnet_cidr_1a" {
  description = "CIDR block for subnet-AZ 1a"
  type        = string
}

variable "subnet_cidr_1b" {
  description = "CIDR block for subnet-AZ 1b"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance Type"
  type        = string
}