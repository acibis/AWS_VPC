output "bastion_sg" {
  value       = aws_security_group.public.id
  description = "The id of the bastion sg"
}

output "private_sg" {
  value       = aws_security_group.private.id
  description = "The id of the private network sg"
}