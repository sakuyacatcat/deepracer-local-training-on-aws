module "network" {
  source = "../../modules/network"

  vpc_cidr    = "10.0.0.0/16"
  subnet_cidr = "10.0.1.0/24"
  vpc_name    = "dev-vpc"
  subnet_name = "dev-subnet"
  allowed_ip  = "0.0.0.0/0"
}

module "s3" {
  source      = "../../modules/s3"
  bucket_name = "dev-deepracer-bucket"
}

module "iam" {
  source                = "../../modules/iam"
  role_name             = "dev-deepracer-ec2-role"
  instance_profile_name = "dev-deepracer-instance-profile"
}

module "ec2" {
  source               = "../../modules/ec2"
  ami                  = "ami-072519eedc1730252"
  instance_type        = "c5.2xlarge"
  subnet_id            = module.network.subnet_id
  security_group       = module.network.security_group_id
  iam_instance_profile = module.iam.iam_instance_profile
  volume_size          = 150
  s3_bucket_name       = module.s3.s3_bucket_name # S3のバケット名をモジュールに渡す

  tags = {
    Name = "dev-deepracer-instance"
  }
}
