resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-vpc"
  })
}

resource "aws_subnet" "public" {
  count = length(var.subnet_availability_zones)

  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.public_subnet_cidr_blocks[count.index]
  availability_zone       = var.subnet_availability_zones[count.index]
  map_public_ip_on_launch = true
  tags = merge(var.tags, {
    Name                                          = "${var.name_prefix}-subnet-public-${var.subnet_availability_zones[count.index]}",
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
  })

  depends_on = [ aws_internet_gateway.this ]
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-vpc"
  })
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-vpc-public"
  })
}

resource "aws_route" "public_internet_gateway" {
  route_table_id = aws_route_table.public.id
  gateway_id     = aws_internet_gateway.this.id

  destination_cidr_block = "0.0.0.0/0"

  timeouts {
    create = "5m"
  }
}

resource "aws_route_table_association" "public" {
  count = length(var.subnet_availability_zones)

  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}
