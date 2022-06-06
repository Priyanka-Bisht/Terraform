provider "aws" {
  region     = "us-west-2"
  access_key = "AKIA3NVSGLFPR3VCAC4A"
  secret_key = "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"
}

resource "aws_instance" "myec2" {
  ami           = "ami-083ac7c7ecf9bb9b0"
  instance_type = "t2.micro"
}
