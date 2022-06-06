resource "aws_instance" "myec12" {
  ami           = "ami-083ac7c7ecf9bb9b0"
  instance_type = lookup(var.instance_type, terraform.workspace)
}

variable "instance_type" {
  type = map(any)

  default = {
    default = "t2.micro"
    dev     = "t2.small"
    prd     = "t2.nano"
  }
}
