output "ec2_security_group_id" {
  value = aws_security_group.ec2_sg.id
}

output "rds_security_group_id" {
  value = aws_security_group.rds_sg.id
}

#output "ec2_security_group_id" {
#  description = "Security group ID for EC2"
#  value       = aws_security_group.ec2_sg.id  # Assuming 'ec2_sg' is the name of your security group resource
#}

#output "rds_security_group_id" {
##  description = "Security group ID for RDS"
#  value       = aws_security_group.rds_sg.id  # Assuming 'rds_sg' is the name of your security group resource for RDS
#}
