resource "aws_nat_gateway" "nat" {
  count = var.use_individual_nat_gateways ? length(aws_subnet.public_subnets) : 1
  
  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = var.use_individual_nat_gateways ? aws_subnet.public_subnets[count.index].id : aws_subnet.public_subnets[0].id
  tags = merge(var.common_tags, {
    Name = "${var.common_tags["env"]}-${var.common_tags["proj"]}-NAT"
  })
}

resource "aws_eip" "nat" {
  count = var.use_individual_nat_gateways ? length(aws_subnet.public_subnets) : 1
  tags = merge(var.common_tags, {
    Name = "${var.common_tags["env"]}-${var.common_tags["proj"]}-NAT-eIP"
  })
}