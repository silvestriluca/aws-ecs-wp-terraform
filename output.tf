####### VPC INFORMATIONS #######
output "vpc" {
  value       = aws_vpc.app_vpc
  description = "VPC for app networking"
}

output "vpc_private_subnet_01" {
  value       = aws_subnet.private_subnet_1
  description = "Private subnet 1"
}

output "vpc_private_subnet_02" {
  value       = aws_subnet.private_subnet_2
  description = "Private subnet 2"
}

output "vpc_private_subnet_03" {
  value       = aws_subnet.private_subnet_3
  description = "Private subnet 3"
}

output "vpc_public_subnet_01" {
  value       = aws_subnet.public_subnet_1
  description = "Public subnet 1"
}

output "vpc_public_subnet_02" {
  value       = aws_subnet.public_subnet_2
  description = "Public subnet 2"
}

output "vpc_public_subnet_03" {
  value       = aws_subnet.public_subnet_3
  description = "Public subnet 3"
}
