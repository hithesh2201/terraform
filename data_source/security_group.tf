resource "aws_security_group" "allow" {
  name        = var.name
  description = var.description


  ingress {
    description      = "Allow all inbound traffic"
    from_port        = 0
    to_port          = 0    #to allow all from internet
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]  #ipv4 internet
    # ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

}