# resource "aws_iam_user" "lb" {
#   name  = var.elb_names[count.index]
#   count = 4
#   path  = "/system/"
# }
#
#
# variable "elb_names" {
#   type    = list(any)
#   default = ["dev-lb", "tes-lb", "prod-lb", "monitor-lb"]
# }
