output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.ravali_vpc.id
}

output "vpc_cidr" {
  description = "CIDR block of the VPC"
  value       = aws_vpc.ravali_vpc.cidr_block
}

output "subnet_id" {
  description = "ID of the created subnet"
  value       = aws_subnet.ravali_subnet.id
}

output "subnet_cidr" {
  description = "CIDR block of the subnet"
  value       = aws_subnet.ravali_subnet.cidr_block
}