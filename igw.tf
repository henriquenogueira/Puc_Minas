##### ElasticIP #####
resource "aws_eip" "ip" {
  vpc              = true
  public_ipv4_pool = "amazon"
}

##### Nat Gateway ####
resource "aws_nat_gateway" "nat_gtw" {
  allocation_id     = aws_eip.ip.id
  subnet_id         = aws_subnet.publica_1.id
  connectivity_type = var.connection_type
  tags = {
    Name = var.names_internet_gateway_nat[1]
  }
  depends_on = [aws_eip.ip]
}

##### Internet Gateway #####
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = var.names_internet_gateway_nat[0]
  }
}