resource "aws_instance" "roboshop" {
  # count= length(var.instances_name)
  for_each = var.instance
  ami           = "ami-00b8917ae86a424c9"
  instance_type = each.value
  vpc_security_group_ids = [aws_security_group.allow.id]
  key_name      = "demokey"
   tags = merge(
                {Name = each.key},
                local.common_tags
                )
}
resource "aws_route53_record" "www" {
  # count   = length(var.instances_name)
  for_each = aws_instance.roboshop
  zone_id = var.hosted_zone_id
  name    = each.key != "web" ? "${each.key}.${var.domain_path}" : "${var.domain_path}"
  type    = "A" #ipv4 address
  ttl     = 1
  records = [each.key == "web" ? each.value.public_ip : each.value.private_ip]
}







# resource "aws_instance" "terraform-server-2" {
#   ami           = "ami-00b8917ae86a424c9"
#   instance_type = "t2.micro"
# }
# resource "aws_instance" "terraform-server-3" {
#   ami           = "ami-00b8917ae86a424c9"
#   instance_type = "t2.micro"
# }