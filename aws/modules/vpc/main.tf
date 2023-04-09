resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "first-vpc"
  }
}
resource "aws_subnet" "mysubnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = ["192.168.1.0/24", "192.168.2.0/24"]

  tags = {
    Name = "first-subnet[0]"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "gw"
  }
}

resource "aws_route_table" "my-route" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = ["192.168.1.0/24", "192.168.2.0/24"]
    gateway_id = aws_internet_gateway.rw.id
  }

  tags = {
    Name = "route"
  }
}

resource "aws_route_table_association" "route-associate" {
  subnet_id      = aws_subnet.mysubnet.id
  route_table_id = aws_route_table.my-route.id
}