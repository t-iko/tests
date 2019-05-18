######################################
# アクセスキー
######################################
provider "aws" {
    shared_credentials_file = "/Users/ikomatoshihito/.aws/credentials"
    profile = "my-profile-name"
    region = "${var.aws_region}"
}

######################################
# VPCを作成する
######################################
resource "aws_vpc" "terraform_test_vpc" {
  cidr_block = "${var.vpc_cidr}"
  instance_tenancy = "default"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"
  enable_classiclink = "false"

  tags {
    Name = "${var.vpc_name}"
  }
}

######################################
# InternetGatewayを作成する
######################################
resource "aws_internet_gateway" "terraform_test_igw" {
  vpc_id = "${aws_vpc.terraform_test_vpc.id}"

  tags {
    Name = "${var.igw_name}"
  }
}

######################################
# Subnet（Public）を作成する
######################################
resource "aws_subnet" "terraform_test_public_subnet1a" {
  vpc_id = "${aws_vpc.terraform_test_vpc.id}"
  cidr_block = "${var.public_subnet_cidr1}"
  availability_zone = "${var.availability_zone1}"

  tags {
    Name = "${var.public_subnet_name1}"
  }
}

resource "aws_subnet" "terraform_test_public_subnet1c" {
  vpc_id = "${aws_vpc.terraform_test_vpc.id}"
  cidr_block = "${var.public_subnet_cidr2}"
  availability_zone = "${var.availability_zone2}"

  tags {
    Name = "${var.public_subnet_name2}"
  }
}

######################################
# Subnet（Private）を作成する
######################################
resource "aws_subnet" "terraform_test_private_subnet1a" {
  vpc_id = "${aws_vpc.terraform_test_vpc.id}"
  cidr_block = "${var.private_subnet_cidr1}"
  availability_zone = "${var.availability_zone1}"

  tags {
    Name = "${var.private_subnet_name1}"
  }
}

resource "aws_subnet" "terraform_test_private_subnet1c" {
  vpc_id = "${aws_vpc.terraform_test_vpc.id}"
  cidr_block = "${var.private_subnet_cidr2}"
  availability_zone = "${var.availability_zone2}"

  tags {
    Name = "${var.private_subnet_name2}"
  }
}

######################################
# NatGatewayを作成する
######################################
resource "aws_nat_gateway" "terraform_test_nat1" {
  allocation_id = "${var.eipalloc_id1}"
  subnet_id = "${aws_subnet.terraform_test_public_subnet1a.id}"

  tags {
    Name = "${var.nat_gateway_name1}"
  }
}

resource "aws_nat_gateway" "terraform_test_nat2" {
  allocation_id = "${var.eipalloc_id2}"
  subnet_id = "${aws_subnet.terraform_test_public_subnet1c.id}"

  tags {
    Name = "${var.nat_gateway_name2}"
  }
}

######################################
# NetworkACL(Public)を作成する
######################################
resource "aws_network_acl" "terraform_test_public_network_acl1" {
  vpc_id = "${aws_vpc.terraform_test_vpc.id}"
  subnet_ids = ["${aws_subnet.terraform_test_public_subnet1a.id}"]

  egress {
    protocol   = "all"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "all"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "${var.public_network_acl_name1}"
  }
}

resource "aws_network_acl" "terraform_test_public_network_acl2" {
  vpc_id = "${aws_vpc.terraform_test_vpc.id}"
  subnet_ids = ["${aws_subnet.terraform_test_public_subnet1c.id}"]

  egress {
    protocol   = "all"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "all"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "${var.public_network_acl_name2}"
  }
}

######################################
# NetworkACL(Private)を作成する
######################################
resource "aws_network_acl" "terraform_test_private_network_acl1" {
  vpc_id = "${aws_vpc.terraform_test_vpc.id}"
  subnet_ids = ["${aws_subnet.terraform_test_private_subnet1a.id}"]

  egress {
    protocol   = "all"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "all"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "${var.private_network_acl_name1}"
  }
}

resource "aws_network_acl" "terraform_test_private_network_acl2" {
  vpc_id = "${aws_vpc.terraform_test_vpc.id}"
  subnet_ids = ["${aws_subnet.terraform_test_private_subnet1c.id}"]

  egress {
    protocol   = "all"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "all"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "${var.private_network_acl_name2}"
  }
}
######################################
# VPCPeeringを作成する
######################################
#resource "aws_vpc_peering_connection" "terraformtest_to_api_connection" {
#    peer_vpc_id = "${var.peer_vpc_id}"
#    vpc_id = "${aws_vpc.terraform_test_vpc.id}"
#    peer_region ="${var.peer_region}"
#
#    tags {
#        Name = "${var.peering_connection_name}"
#    }
#}

#resource "aws_vpc_peering_connection_accepter" "terraform_test_to_api_peer_accepter" {
#    provider                  = "aws.peer"
#    vpc_peering_connection_id = "${aws_vpc_peering_connection.terraform_test_to_api_connection.id}"
#    auto_accept               = true
#}

######################################
# RouteTable（Public）を作成する
######################################
resource "aws_route_table" "terraform_test_public_route_table1" {
  vpc_id = "${aws_vpc.terraform_test_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.terraform_test_igw.id}"
  }

  tags {
    Name = "${var.public_route_table_name1}"
  }
}

resource "aws_route_table" "terraform_test_public_route_table2" {
  vpc_id = "${aws_vpc.terraform_test_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.terraform_test_igw.id}"
  }

  tags {
    Name = "${var.public_route_table_name2}"
  }
}

######################################
# RouteTable（Private）を作成する
######################################
resource "aws_route_table" "terraform_test_private_route_table1" {
  vpc_id = "${aws_vpc.terraform_test_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.terraform_test_nat1.id}"
  }

#  route {
#    cidr_block = "${var.peer_vpc_cidr}"
#    gateway_id = "${aws_vpc_peering_connection.terraform_test_to_api_connection.id}"
#  }

  tags {
    Name = "${var.private_route_table_name1}"
  }
}


resource "aws_route_table" "terraform_test_private_route_table2" {
  vpc_id = "${aws_vpc.terraform_test_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.terraform_test_nat2.id}"
  }

#  route {
#    cidr_block = "${var.peer_vpc_cidr}"
#    gateway_id = "${aws_vpc_peering_connection.terraform_test_to_api_connection.id}"
#  }

  tags {
    Name = "${var.private_route_table_name2}"
  }
}

######################################
# SubnetRouteTableAssociationを作成する
######################################
resource "aws_route_table_association" "terraform_test_public_association1" {
    subnet_id = "${aws_subnet.terraform_test_public_subnet1a.id}"
    route_table_id = "${aws_route_table.terraform_test_public_route_table1.id}"
}

resource "aws_route_table_association" "terraform_test_public_association2" {
    subnet_id = "${aws_subnet.terraform_test_public_subnet1c.id}"
    route_table_id = "${aws_route_table.terraform_test_public_route_table2.id}"
}

resource "aws_route_table_association" "terraform_test_private_association1" {
    subnet_id = "${aws_subnet.terraform_test_private_subnet1a.id}"
    route_table_id = "${aws_route_table.terraform_test_private_route_table1.id}"
}

resource "aws_route_table_association" "terraform_test_private_association2" {
    subnet_id = "${aws_subnet.terraform_test_private_subnet1c.id}"
    route_table_id = "${aws_route_table.terraform_test_private_route_table2.id}"
}
