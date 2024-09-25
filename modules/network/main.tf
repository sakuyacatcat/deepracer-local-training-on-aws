resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_cidr

  tags = {
    Name = var.subnet_name
  }
}

resource "aws_security_group" "deepracer_sg" {
  vpc_id = aws_vpc.main.id
  name   = "deepracer-sg"

  ingress {
    from_port   = 8100
    to_port     = 8100
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ip]
  }

  ingress {
    from_port   = 8888
    to_port     = 8888
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "deepracer-security-group"
  }
}
