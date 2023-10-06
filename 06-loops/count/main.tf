variable "components" {
  default = ["frontend", "mongodb", "catalogue"]
}

resource "aws_instance" "instance" {

  count = length(var.components)

  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.small"
  vpc_security_group_ids = [ "sg-0634b360d4d7dc216" ]

  tags = {
    // name = var.component[count.index]
    Name = element(var.components, count.index)
  }
}