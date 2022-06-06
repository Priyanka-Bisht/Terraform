# provider "aws" {
#   region     = "us-west-2"
#   access_key = "AKIA3NVSGLFPR3VCAC4A"
#   secret_key = "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"
# }
#
# resource "aws_instance" "myec2" {
#   ami           = "ami-083ac7c7ecf9bb9b0"
#   instance_type = var.types.us-east-1
# }
#
# variable "list" {
#   type    = list(any)
#   default = ["m5.large", "m5.xlarge", "t2.medium"]
# }
#
# variable "types" {
#   type = map(any)
#   default = {
#     us-east-1  = "t2.micro"
#     us-west-2  = "t2.nano"
#     ap-south-1 = "t2.small"
#   }
# }
