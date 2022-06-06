resource "aws_instance" "myec2" {
  ami           = "ami-083ac7c7ecf9bb9b0"
  instance_type = "t2.micro"
  count         = 3
}
