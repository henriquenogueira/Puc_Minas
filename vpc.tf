resource "aws_vpc" "main" {
  cidr_block       = var.vpc_main_range
  instance_tenancy = "default"

  tags = {
    Name = "vpn_main"
  }
}