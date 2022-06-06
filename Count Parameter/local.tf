resource "aws_instance" "dev-lb" {
  ami           = "ami-083ac7c7ecf9bb9b0"
  instance_type = "t2.micro"
  tags          = local.common_tags
}

resource "aws_instance" "prod-lb" {
  ami           = "ami-083ac7c7ecf9bb9b0"
  instance_type = "t2.micro"
  tags          = local.common_tags
}

resource "aws_ebs_volume" "db_ebs" {
  availability_zone = "us-west-2a"
  size              = 8
  tags              = local.common_tags
}

locals {
  common_tags = {
    owner   = "DevOps Team"
    service = "backend"
  }
}
