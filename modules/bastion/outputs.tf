output "instance_ip" {
  value       = aws_instance.bastion.private_ip
  description = "The ip of the bastion aws_instance"
}
