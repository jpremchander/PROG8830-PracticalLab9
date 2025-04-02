output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_1a_id" {
  value = aws_subnet.public_subnet_1a.id
}

output "public_subnet_1b_id" {
  value = aws_subnet.public_subnet_1b.id
}

output "private_subnet_1a_id" {
  value = aws_subnet.private_subnet_1a.id
}

output "private_subnet_1b_id" {
  value = aws_subnet.private_subnet_1b.id
}
