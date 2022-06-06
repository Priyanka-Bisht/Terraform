# resource "aws_instance" "myec3" {
#   ami           = "ami-083ac7c7ecf9bb9b0"
#   instance_type = "t2.micro"
#
#   provisioner "local-exec" {
#     command = "echo ${aws_instance.myec3.private_ip} >> private_ips.txt"
#   }
# }
