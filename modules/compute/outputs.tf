output "instance_ip" {
  value       = aws_instance.app_instance.private_ip
  description = "The ip of the compute aws_instance"
}

