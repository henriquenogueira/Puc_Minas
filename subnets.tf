######### subnets publicas #########

resource "aws_subnet" "publica_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.aws_subnets_ranges[0]
  availability_zone = var.aws_zones[0]

  tags = {
    Name = var.aws_subnets_names[0]
  }
}

resource "aws_subnet" "publica_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.aws_subnets_ranges[1]
  availability_zone = var.aws_zones[1]

  tags = {
    Name = var.aws_subnets_names[1]
  }
}

resource "aws_subnet" "publica_3" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.aws_subnets_ranges[2]
  availability_zone = var.aws_zones[2]

  tags = {
    Name = var.aws_subnets_names[2]
  }
}

######### subnets privadas #########

resource "aws_subnet" "privada_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.aws_subnets_ranges[3]
  availability_zone = var.aws_zones[3]
  tags = {
    Name = var.aws_subnets_names[3]
  }
}

resource "aws_subnet" "privada_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.aws_subnets_ranges[4]
  availability_zone = var.aws_zones[4]
  tags = {
    Name = var.aws_subnets_names[4]
  }
}

resource "aws_subnet" "privada_3" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.aws_subnets_ranges[5]
  availability_zone = var.aws_zones[5]
  tags = {
    Name = var.aws_subnets_names[5]
  }
}