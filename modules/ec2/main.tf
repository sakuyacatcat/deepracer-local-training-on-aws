resource "aws_instance" "deepracer_instance" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true

  security_groups      = [var.security_group]
  iam_instance_profile = var.iam_instance_profile

  root_block_device {
    volume_size = var.volume_size
  }

  instance_market_options {
    market_type = "spot"

    spot_options {
      max_price                      = "0.2"
      spot_instance_type             = "persistent"
      instance_interruption_behavior = "stop"
    }
  }

  metadata_options {
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
    http_endpoint               = "enabled"
  }

  tags = var.tags

  user_data = <<-EOF
              #!/bin/bash
              git clone https://github.com/aws-deepracer-community/deepracer-for-cloud.git /home/ubuntu/deepracer-for-cloud
              echo "DR_LOCAL_S3_PROFILE=default" > /home/ubuntu/deepracer-for-cloud/system.env
              echo "DR_LOCAL_S3_BUCKET=${aws_s3_bucket.deepracer_bucket.bucket}" >> /home/ubuntu/deepracer-for-cloud/system.env
              echo "DR_UPLOAD_S3_PROFILE=default" >> /home/ubuntu/deepracer-for-cloud/system.env
              echo "DR_UPLOAD_S3_BUCKET=${aws_s3_bucket.deepracer_bucket.bucket}" >> /home/ubuntu/deepracer-for-cloud/system.env

              cd /home/ubuntu/deepracer-for-cloud && ./bin/prepare.sh
              EOF
}
