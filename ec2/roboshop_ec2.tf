resource "aws_instance" "ec2_instances" {
  count = length(var.instances_name)

  ami           = "ami-03265a0778a880afb"
  instance_type = try(var.instance_type_mapping[var.instances_name[count.index]], var.instance_type_mapping["default"])

  vpc_security_group_ids = ["sg-0f0225d73ad9227cc"]

  tags = {
    Name = var.instances_name[count.index]
  }
}

resource "aws_route53_record" "dns_records" {
  count = length(var.instances_name)

  zone_id = var.hosted_zone_id
  name    = "${var.instances_name[count.index]}.${var.domain_path}"
  type    = "A"
  ttl     = 1

  records = [aws_instance.ec2_instances[count.index].private_ip]
}

