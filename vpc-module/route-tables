resource "aws_route_table" "rt" {
  count = length(var.availability_zones)

  vpc_id = aws_vpc.my_vpc.id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    "Name" = "Internet-Gateway"
  }
}

resource "aws_route_table_association" "rt_association" {
  count = length(var.availability_zones)

  subnet_id = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.rt[count.index].id
}
