resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.range_any
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = var.rt_names[1]
  }
  depends_on = [aws_vpc.main]
}

resource "aws_route_table" "rt_private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.range_any
    gateway_id = aws_nat_gateway.nat_gtw.id
  }

  tags = {
    Name = var.rt_names[0]
  }
  depends_on = [aws_vpc.main]
}

#### route table privada ####
resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.privada_1.id
  route_table_id = aws_route_table.rt_private.id
}
resource "aws_route_table_association" "private_2" {
  subnet_id      = aws_subnet.privada_2.id
  route_table_id = aws_route_table.rt_private.id
}
resource "aws_route_table_association" "private_3" {
  subnet_id      = aws_subnet.privada_3.id
  route_table_id = aws_route_table.rt_private.id
}


#### route table publica ####
resource "aws_route_table_association" "publica_1" {
  subnet_id      = aws_subnet.publica_1.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "publica_2" {
  subnet_id      = aws_subnet.publica_2.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "publica_3" {
  subnet_id      = aws_subnet.publica_3.id
  route_table_id = aws_route_table.public.id
}