variable "subnet_ids" {}
variable "eks_name" {}
variable "eks_version" {}
variable "common_tags" {
    type = map(string)
    default = {
        env     = "dev"
        team    = "devops"
        purpose = "general"
        proj    = "test"

    }
}
