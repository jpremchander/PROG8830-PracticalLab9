variable "db_subnet_group_name" {
  description = "name of the DB subnet group"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for RDS"
  type        = list(string)
}

variable "db_parameter_group_name" {
  description = "name of the DB parameter group"
  type        = string
}

variable "db_family" {
  description = "DB engine family"
  type        = string
}

variable "db_identifier" {
  description = "DB instance identifier"
  type        = string
}

variable "db_engine_version" {
  description = "DB engine version"
  type        = string
}

variable "db_instance_class" {
  description = "DB instance class"
  type        = string
}

variable "db_storage" {
  description = "allocated storage for the DB instance"
  type        = number
}

variable "db_username" {
  description = "DB username"
  type        = string
}

variable "db_password" {
  description = "DB password"
  type        = string
  sensitive   = true
}

variable "vpc_security_group_ids" {
  description = "VPC security group IDs for RDS DB instance"
  type        = list(string)
}

variable "publicly_accessible" {
  description = "DB instance public access"
  type        = bool
}