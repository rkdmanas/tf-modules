resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.vpc.id

  tags = merge(var.common_tags, {
    Name = "${var.common_tags["env"]}-${var.common_tags["proj"]}-Internet-Gateway"
  })
}
