output "instance_id" {
  description = "ID of the created EC2 instance"
  value       = aws_instance.deepracer_instance.id
}

output "public_ip" {
  description = "Public IP of the created EC2 instance"
  value       = aws_instance.deepracer_instance.public_ip
}
