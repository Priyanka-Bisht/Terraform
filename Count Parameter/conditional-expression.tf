resource "aws_instance" "dev" {
  ami           = "ami-083ac7c7ecf9bb9b0"
  instance_type = "t2.micro"
  count         = var.istrue == true ? 3 : 0
}

resource "aws_instance" "prod" {
  ami           = "ami-083ac7c7ecf9bb9b0"
  instance_type = "t2.nano"
  count         = var.istrue == false ? 1 : 0
}

variable "istrue" {}
