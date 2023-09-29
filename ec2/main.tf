resource "aws_instance" "web" {
  ami           = var.ec2_auto_ami? data.aws_ami.ubuntu.id : var.ec2_ami
  instance_type = "t3.micro"

  tags = merge(var.common_tags, {
    Name = "Web-EC2-${var.common_tags["env"]}"
  })
}