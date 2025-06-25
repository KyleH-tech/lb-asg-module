resource "aws_subnet" "public_subnet" {
  count = length(var.availability_zones)

  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "192.192.${count.index + 1}.0/24"
  map_public_ip_on_launch = true
  availability_zone = var.availability_zones[count.index]

  tags = {
    "Name" = "Public-subnet-${var.availability_zones[count.index]}"
  }
}
