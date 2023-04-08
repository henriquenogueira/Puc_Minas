variable "ami" {
  default = "ami-00c39f71452c08778"
}

variable "instance_type" {
  default = "t3.medium"
}

variable "aws_zones" {
  type = list(string)
  default = [
    "us-east-1a", "us-east-1b", "us-east-1c",
     "us-east-1d", "us-east-1e", "us-east-1f"
    ]
}

variable "aws_subnets_ranges" {
  type = list(string)
  default = [
    "10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24",
     "10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"
    ]
}

variable "aws_subnets_names" {
  type = list(string)
  default = [
    "subnet_publica_1", "subnet_publica_2", "subnet_publica_3",
     "subnet_privada_1", "subnet_privada_2", "subnet_privada_3"
    ]
}

variable "autoscalling_servers_names" {
  type = list(string)
  default = [
    "autoscalling-privado-servers", 
    "autoscalling-publico-servers"
    ]
}

variable "lb_name" {
  type = list(string)
  default = [
    "lb-servers-privado", 
    "lb-servers-publico"
    ]
}

variable "type_lb" {
  default = "application"
}

variable "s3_name" {
  default = "backup-files-office-puc"
}

variable "target_group_privado_name" {
  default = "servers-privado"
}

variable "https_port" {
  default = 443
}

variable "policy_up_name" {
  default = "CPU UP"
}

variable "policy_down_name" {
  default = "CPU DOWN"
}

variable "vpc_main_range" {
  default = "10.0.0.0/16"
}

variable "launch_template_name_firewall" {
  default = "pfsense_firewall"
}

variable "launch_template_name_servidores_internos" {
  default = "servidores_internos"
}

variable "bucket_acl" {
  default = "private"  
}

variable "rt_names" {
  type = list(string)
  default = [
    "rt_privada", 
    "rt_publica" 
    ]
}

variable "range_any" {
  default = "0.0.0.0/0" 
}

variable "domain_name" {
  default = "meu.exemplo.com"
}

variable "protocol_http" {
  default = "HTTP"
}

variable "default_actions" {
  default = "forward"
}

variable "names_internet_gateway_nat" {
  type = list(string)
  default = [ 
    "Internet Gateway", 
    "Nat Gateway"
    ]
}

variable "connection_type" {
  default = "public" 
}

variable "target_group_name_publico" {
  default = "pfsense-tg"  
}

variable "adjustment_type" {
  default =  "ChangeInCapacity"  
}

variable "device_name" {
  default = "/dev/sdf" 
}

variable "resource_type" {
  default = "instance"
}

variable "profile" {
  default = "henrique"
}

variable "region" {
  default = "us-east-1"
}

variable "status_s3" {
  default = "Enabled"
}
