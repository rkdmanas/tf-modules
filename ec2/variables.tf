variable "common_tags" {
    type = map(string)
    default = {
        env     = "development"
        team    = "devops"
        purpose = "general"
    }
}

variable "ec2_ami" {
  type = string
  default = "ami-8677uuuy76"
}

variable "ec2_auto_ami" {
    type = bool
    default = true
}