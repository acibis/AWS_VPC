output "public_subnet_id" {
  value       = aws_subnet.public.id
  description = "The id of the public network"
}

output "private_subnet_id" {
  value       = aws_subnet.private.id
  description = "The id of the public network"
}

output "vpc_id" {
  value       = aws_vpc.vpc.id
  description = "The id of the public network"
}

