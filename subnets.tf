resource "aws_subnet" "publica_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = var.availability_zone_1a

  tags = {
    Name = "subnet_publica_1"
  }
}

resource "aws_subnet" "publica_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = var.availability_zone_1b

  tags = {
    Name = "subnet_publica_2"
  }
}

resource "aws_subnet" "publica_3" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = var.availability_zone_1c

  tags = {
    Name = "subnet_publica_3"
  }
}

################################# subnets privadas ###############################

resource "aws_subnet" "privada_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = var.availability_zone_1d
  tags = {
    Name = "subnet_privada_1"
  }
}

resource "aws_subnet" "privada_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.5.0/24"
  availability_zone = var.availability_zone_1e
  tags = {
    Name = "subnet_privada_2"
  }
}

resource "aws_subnet" "privada_3" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.6.0/24"
  availability_zone = var.availability_zone_1f
  tags = {
    Name = "subnet_privada_3"
  }
}