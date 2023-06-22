resource "aws_vpc" "volt" {
  cidr_block = "${var.cidr}"
  tags = {
    Name = "${var.prefix}vpc"
  }
}

resource "aws_subnet" "volterra_outside" {
  cidr_block        = "${var.cidroutside}"
  availability_zone = local.azs[0]
  vpc_id            = aws_vpc.volt.id
  tags = {
    Name = "${var.prefix}outside"
  }
}

resource "aws_subnet" "volterra_inside" {
  cidr_block        = "${var.cidrinside}"
  availability_zone = local.azs[0]
  vpc_id            = aws_vpc.volt.id
  tags = {
    Name = "${var.prefix}inside"
  }
}

resource "aws_subnet" "volterra_worker" {
  cidr_block        = "${var.cidrworkload}"
  availability_zone = local.azs[0]
  vpc_id            = aws_vpc.volt.id
   
  tags = {
    Name = "${var.prefix}worker"
  }
}

resource "aws_internet_gateway" "volt" {
  vpc_id = aws_vpc.volt.id

  tags = {
    Name = "${var.prefix}igw"
  }
}

resource "aws_default_route_table" "default" {
  default_route_table_id = aws_vpc.volt.default_route_table_id

  route {
    gateway_id = aws_internet_gateway.volt.id
    cidr_block = "0.0.0.0/0"
  }

  tags = {
    Name = "defult rt"
  }
}

resource "aws_route_table_association" "volterra_outside" {
  subnet_id      = aws_subnet.volterra_outside.id
  route_table_id = aws_vpc.volt.default_route_table_id
}

resource "aws_route_table_association" "volterra_inside" {
  subnet_id      = aws_subnet.volterra_inside.id
  route_table_id = aws_vpc.volt.default_route_table_id
}