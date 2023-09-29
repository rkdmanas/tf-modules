resource "aws_eip" "ec2_ip" {
  instance = aws_instance.web.id
  domain   = "vpc"

  tags = merge(var.common_tags, {
    Name = "Web-Ec2-eIP-${var.common_tags["env"]}"
  })

}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.web.id
  allocation_id = aws_eip.ec2_ip.id
}