


module "ec2_cluster" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 2.0"

  name           = "my-cluster"
  instance_count = 1

  ami           = "ami-083ac7c7ecf9bb9b0"
  instance_type = "t2.micro"
  subnet_id     = "subnet-714ed209"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
