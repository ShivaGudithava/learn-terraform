variable "security_groups" {
  default = ["sg-0634b360d4d7dc216"]
}

variable "zone_id" {
  default = "Z02904712FMTLMWVAWWYZ"
}

variable "components" {
  default = {
    frontend = {
      name = "frontend"
      instance_type = "t3.micro"
    }
    cart = {
      name = "cart"
      instance_type = "t3.micro"
    }
  }
}
