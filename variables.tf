variable "ami" {
  default = "ami-00c39f71452c08778"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "availability_zone_1c" {
  default = "us-east-1c"
}

variable "availability_zone_1a" {
  default = "us-east-1a"
}

variable "availability_zone_1b" {
  default = "us-east-1b"
}

variable "availability_zone_1f" {
  default = "us-east-1f"
}

variable "availability_zone_1d" {
  default = "us-east-1d"
}

variable "availability_zone_1e" {
  default = "us-east-1e"
}

variable "autoscalling_servers_privados" {
  default = "autoscalling-privado-servers"
}

variable "autoscalling_servers_publicos" {
  default = "autoscalling-publico-servers"
}


variable "lb_name_publico" {
  default = "lb-servers-publico"
}

variable "lb_name_privado" {
  default = "lb-servers-privado"
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