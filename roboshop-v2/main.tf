variable "ami" {
  default = "ami-03265a0778a880afb"
}

variable "security_groups" {
  default = ["sg-0634b360d4d7dc216"]
}

variable "instance_type" {
  default = "t3.small"
}

variable "zone_id" {
  default = "Z02904712FMTLMWVAWWYZ"
}

variable "components" {
  default = {
    frontend = { name = "frontend-dev"}
    catalogue = { name = "catalogue-dev"}
    mongodb = { name = "mongodb-dev"}
    user = { name = "user-dev"}
    cart = { name = "cart-dev"}
    redis = { name = "redis-dev"}
    mysql = { name = "mysql-dev"}
    shipping = { name = "shipping-dev"}
    payment = { name = "payment-dev"}
    rabbitmq = { name = "rabbitmq-dev"}
  }
}


resource "aws_instance" "instance" {
 for_each = var.components
  ami = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = var.security_groups

  tags = {
    Name = lookup(each.value,"name", null)
  }
}
