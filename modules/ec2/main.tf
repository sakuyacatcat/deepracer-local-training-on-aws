resource "aws_instance" "deepracer_instance" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  associate_public_ip_address = true

  security_groups = [var.security_group]

  iam_instance_profile = var.iam_instance_profile

  root_block_device {
    volume_size = var.volume_size
  }

  tags = var.tags

  user_data = file("${path.module}/user_data.sh")
}
