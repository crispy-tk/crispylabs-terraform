################################################################################
# VPC
################################################################################
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = merge(
    { "Name" = "${var.vpc_name}-vpc" },
    var.tags
  )
}

resource "aws_vpc_dhcp_options" "vpc_dhcp" {
  domain_name         = "ec2.internal"
  domain_name_servers = ["AmazonProvidedDNS"]

  tags = merge(
    { "Name" = "${var.vpc_name}-vpc-dhcp" },
    var.tags
  )
}

resource "aws_vpc_dhcp_options_association" "vpc_dhcp_association" {
  vpc_id          = aws_vpc.vpc.id
  dhcp_options_id = aws_vpc_dhcp_options.vpc_dhcp.id
}

################################################################################
# PUBLIC SUBNET AND RESOURCES
################################################################################
// attach to VPC
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.vpc_name}-vpc"
  }
}

// attach to VPC
// highest level CIDR
resource "aws_route_table" "rt_public" {
  vpc_id = aws_vpc.vpc.id

  // public
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = merge(
    { "Name" = "${var.vpc_name}-rt_public" },
    var.tags
  )
}

resource "aws_subnet" "sn_pub" {
  for_each          = var.sn_pub
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone

  tags = merge(
    { "Name" = "${var.vpc_name}-sn_pub-${each.value.availability_zone}" },
    var.tags
  )
}

resource "aws_route_table_association" "sn_pub_rt" {
  for_each       = var.sn_pub
  subnet_id      = aws_subnet.sn_pub[each.key].id
  route_table_id = aws_route_table.rt_public.id
}

################################################################################
# PRIVATE SUBNET AND RESOURCES
################################################################################
resource "aws_eip" "nat" {
  network_border_group = "us-east-1"
  public_ipv4_pool     = "amazon"
  vpc                  = true

  tags = merge(
    { "Name" = "${var.vpc_name}-eip_nat" },
    var.tags
  )
}

resource "aws_nat_gateway" "nat_public" {
  allocation_id     = aws_eip.nat.id
  connectivity_type = "public"
  subnet_id         = aws_subnet.sn_pub["pub-1a"].id

  tags = merge(
    { "Name" = "${var.vpc_name}-vpc-${var.aws_region}" },
    var.tags
  )
}

resource "aws_route_table" "rt_private" {
  vpc_id = aws_vpc.vpc.id

  // public
  route {
    cidr_block     = var.rt_priv.cidr_block
    nat_gateway_id = aws_nat_gateway.nat_public.id
  }

  tags = merge(
    { "Name" = "${var.vpc_name}-rt_private" },
    var.tags
  )
}

resource "aws_subnet" "sn_priv" {
  for_each          = var.sn_priv
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone

  tags = merge(
    { "Name" = "${var.vpc_name}-sn_priv-${each.value.availability_zone}" },
    var.tags
  )
}

resource "aws_route_table_association" "sn_priv_rt" {
  for_each       = var.sn_priv
  subnet_id      = aws_subnet.sn_priv[each.key].id
  route_table_id = aws_route_table.rt_private.id
}