resource "aws_apigatewayv2_vpc_link" "vpc_link" {
  name               = "${var.common_tags["env"]}-${var.common_tags["proj"]}-${var.api-gw-name}-vpcLink"
  security_group_ids = [resource.aws_security_group.allow_tls.id]
  subnet_ids         = var.private_subnets

  tags = {
    Usage = "${var.common_tags["env"]}-${var.common_tags["proj"]}-${var.api-gw-name}-Usage"
  }
}