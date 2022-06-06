resource "aws_security_group" "allow_ssh1" {
  name        = "allow_ssh1"
  description = "Allow SSH inbound traffic"

  ingress {
    description = "SSH into VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_instance" "myec4" {
  ami                    = "ami-083ac7c7ecf9bb9b0"
  instance_type          = "t2.micro"
  key_name               = "ec2-key"
  vpc_security_group_ids = [aws_security_group.allow_ssh1.id]

  provisioner "remote-exec" {
    on_failure = continue
    inline = [
      "sudo yum - y install nano"
    ]
  }



  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("./ec2-key.pem")
    host        = self.public_ip
  }
}
