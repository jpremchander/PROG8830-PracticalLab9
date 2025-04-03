output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_1a_id" {
  value = aws_subnet.subnet_1a.id
}

output "subnet_1b_id" {
  value = aws_subnet.subnet_1b.id
}

#output "subnet_1a_id" {
#  description = "Subnet ID for availability zone 1a"
#  value       = aws_subnet.subnet_1a.id  # Assuming 'subnet_1a' is the name of your subnet resource
#}

#output "subnet_1b_id" {
#  description = "Subnet ID for availability zone 1b"
#  value       = aws_subnet.subnet_1b.id  # Assuming 'subnet_1b' is the name of your subnet resource
#}
