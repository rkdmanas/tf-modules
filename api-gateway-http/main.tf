resource "aws_apigatewayv2_api" "apiv2" {
  name          = "${var.common_tags["env"]}-${var.common_tags["proj"]}-${var.api-gw-name}"
  description   = "Created by TF"
  protocol_type = var.api_v2_protocol
  disable_execute_api_endpoint = true

}


resource "aws_apigatewayv2_stage" "stage" {
  api_id = aws_apigatewayv2_api.apiv2.id
  name   = "${var.common_tags["env"]}-${var.common_tags["proj"]}-stage"
  auto_deploy = true
}


resource "aws_apigatewayv2_route" "default_route" {
  api_id    = aws_apigatewayv2_api.apiv2.id
  route_key = "$default"
}