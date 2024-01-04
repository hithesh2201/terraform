resource "aws_instance" "roboshop" {
  count= length(var.instances_name)
  ami           = "ami-00b8917ae86a424c9"
  instance_type = var.instances_name[count.index] == "mongod" || var.instances_name[count.index] == "shipping" || var.instances_name[count.index] == "mysql"  ? "t3.small" : "t2.micro" #conditon? true_value : false_value
  vpc_security_group_ids = [aws_security_group.allow.id]
  key_name      = "demokey"
   tags = merge(
                {Name = var.instances_name[count.index]},
                local.common_tags
                )
}
resource "aws_route53_record" "www" {
  count   = length(var.instances_name)
  zone_id = var.hosted_zone_id
  name    = var.instances_name[count.index] != "web" ? "${var.instances_name[count.index]}.${var.domain_path}" : "${var.domain_path}"
  type    = "A" #ipv4 address
  ttl     = 1
  records = [var.instances_name[count.index] == "web" ? aws_instance.roboshop[count.index].public_ip : aws_instance.roboshop[count.index].private_ip]
}







# resource "aws_instance" "terraform-server-2" {
#   ami           = "ami-00b8917ae86a424c9"
#   instance_type = "t2.micro"
# }
# resource "aws_instance" "terraform-server-3" {
#   ami           = "ami-00b8917ae86a424c9"
#   instance_type = "t2.micro"
# }