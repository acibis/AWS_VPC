#configugre backend
terraform {
  backend "s3" {
    key    = "network/terraform.tfstate"
    bucket = "tfstatechg"
    region = "eu-west-1"
  }
}

# VPC
resource "aws_vpc" "vpc" {
  cidr_block                       = var.cidr
  enable_dns_hostnames             = var.enable_dns_hostnames
  enable_dns_support               = var.enable_dns_support

  tags = merge(
    {
      "Name" = format("%s", var.name)
    },
    var.tags,
  )
}

resource "aws_internet_gateway" "igw" {
  count = length(var.public_subnets) > 0 ? 1 : 0

  vpc_id = aws_vpc.vpc.id

  tags = merge(
    {
      "Name" = format("%s", var.name)
    },
    var.tags,
  )
}


# Public subnet
resource "aws_subnet" "public" {

  vpc_id                          = aws_vpc.vpc.id
  cidr_block                      = var.public_subnets
  availability_zone               = var.azs
  map_public_ip_on_launch         = var.map_public_ip_on_launch

  tags = merge(
    {
      "Name" = format(
        "%s-${var.public_subnet_suffix}-%s",
        var.name,
        var.azs,
      )
    },
    var.tags,
  )
}

# Private subnet
resource "aws_subnet" "private" {
  vpc_id                          = aws_vpc.vpc.id
  cidr_block                      = var.private_subnets
  availability_zone               = var.azs

  tags = merge(
    {
      "Name" = format(
        "%s-${var.private_subnet_suffix}-%s",
        var.name,
        var.azs,
      )
    },
    var.tags,
  )
}

# Load Balancer
# would be created if not the contraint:
# At least two subnets in two different Availability Zones must be specified to create LB
# resource "aws_lb" "lb" {
#   internal           = true
#   load_balancer_type = "application"
#   #security_groups    = [aws_subnet.private.*.id]
#   subnets            = [aws_subnet.private.id]

#   tags = merge(
#     {
#       "Name" = format(
#         "%s-${var.alb_suffix}",
#         var.name,
#       )
#     },
#     var.tags,
#   )
# }