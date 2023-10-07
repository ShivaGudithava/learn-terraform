resource "aws_instance" "instance" {
  ami = data.aws_ami.ami.id
  instance_type = var.instance_type
  vpc_security_group_ids = var.security_groups

  tags = {
    Name = var.name
  }

  provisioner "local-exec" {
    command = "sleep 60"
  }
}

resource "aws_route53_record" "record" {
  zone_id = var.zone_id
  name    = "${var.name}-dev.gudishivadevops.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.instance.private_ip ]
}

#resource "null_resource" "ansible" {
#
#  depends_on = [
#    aws_route53_record.record
#  ]


#cd home/root/roboshop-ansible
#git pull
#sleep 30
#ansible-playbook -i ${var.name}-dev.gudishivadevops.online, main.yml -e ansible_user=root -e ansible_password=DevOps321 -e component=${var.name}
#EOF
#  }
#}


