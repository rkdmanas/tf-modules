resource "aws_security_group" "allow_tls" {
  name        = "${var.common_tags["env"]}-${var.common_tags["proj"]}-${var.api-gw-name}-allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]

  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.common_tags["env"]}-${var.common_tags["proj"]}-${var.api-gw-name}-allow_tls"
  }
}