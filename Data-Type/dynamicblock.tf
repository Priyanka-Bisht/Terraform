variable "ingress" {
  type        = list(number)
  description = "list of ingress ports"
  default     = [8200, 8201, 8300, 9500, 9200]
}

resource "aws_security_group" "dynamicsg" {
  name        = "dynamic_sg"
  description = "description for vault"


  dynamic "ingress" {
    for_each = var.ingress
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  dynamic "egress" {
    for_each = var.ingress
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
