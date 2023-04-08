resource "aws_eip" "ip" {
  vpc              = true
  public_ipv4_pool = "amazon"
}

resource "aws_nat_gateway" "nat_gtw" {
  allocation_id     = aws_eip.ip.id
  subnet_id         = aws_subnet.publica_1.id
  connectivity_type = "public"
  tags = {
    Name = "gw NAT"
  }
  depends_on = [aws_eip.ip]
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "internet_gateway"
  }
}