variable "instances_name" {
  default = ["mongod", "mysql", "redis", "catalogue", "user", "cart", "shipping", "payments", "rabbitmq", "dispatch", "web"]
}

variable "instance_type_mapping" {
  default = {
    mongod     = "t2.small"
    mysql      = "t2.small"
    shipping   = "t2.small"
    default    = "t2.micro"
  }
}

variable "domain_path" {

  default = "hiteshshop.online"
}

variable "hosted_zone_id" {
  default = "Z0781952344MQ4MZCJ506"
}

variable "name" {
  type= string
  default = "roboshop-allow"
  
}
variable "description" {
  type= string
  default = "allowing all from internet"
  
}

variable "instance_name" {
  type= string
  default = "mongod"
  
}