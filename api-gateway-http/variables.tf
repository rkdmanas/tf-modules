variable "vpc_id" {}
variable "private_subnets" {}

variable "common_tags" {
    type = map(string)
    default = {
        env     = "development"
        team    = "devops"
        purpose = "general"
    }
}

variable "api_v2_protocol" {
    type = string
    default = "HTTP"
}
variable "api-gw-name" {
    default = "API-GW"
}