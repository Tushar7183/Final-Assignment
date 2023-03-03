resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = "true"
  tags                 = var.vpc_tag

}


resource "aws_subnet" "subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet_cidr
  availability_zone = var.subnet_az
  tags              = var.vpc_tag

}

#Internet Gateway

resource "aws_internet_gateway" "tushar-gateway" {
  vpc_id =aws_vpc.vpc.id
  tags = {
    Name    = "tushar-subnet"
    Owner   = "tushar.bansal@cloudeq.com"
    Purpose = "training"
  }
}

# Route

resource "aws_route_table" "tushar-route" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tushar-gateway.id
  }

  tags = {
    Name    = "tushar-route"
    Owner   = "tushar.bansal@cloudeq.com"
    Purpose = "training"
  }
}

#Subnet-1
resource "aws_route_table_association" "tushar-crta-public-subnet-1" {
  subnet_id      = aws_subnet.subnet.id
  route_table_id = aws_route_table.tushar-route.id
}


# Aws Security Group

resource "aws_security_group" "tushar-security" {
  vpc_id = aws_vpc.vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name    = "tushar-security"
    Owner   = "tushar.bansal@cloudeq.com"
    Purpose = "training"
  }
}