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
resource "aws_subnet" "terraform_test_public_subnet" {
  vpc_id = "${aws_vpc.terraform_test_vpc.id}"
  cidr_block = "${var.public_subnet_cidr}"
  availability_zone = "${var.availability_zone}"

  tags {
    Name = "${var.public_subnet_name}"
  }
}

######################################
# Subnet（Private）を作成する
######################################
resource "aws_subnet" "terraform_test_private_subnet" {
  vpc_id = "${aws_vpc.terraform_test_vpc.id}"
  cidr_block = "${var.private_subnet_cidr}"
  availability_zone = "${var.availability_zone}"

  tags {
    Name = "${var.private_subnet_name}"
  }
}

######################################
# NatGatewayを作成する
######################################
resource "aws_nat_gateway" "terraform_test_nat" {
  allocation_id = "${var.eipalloc_id}"
  subnet_id = "${aws_subnet.terraform_test_public_subnet.id}"

  tags {
    Name = "${var.nat_gateway_name}"
  }
}

######################################
# NetworkACL(Public)を作成する
######################################
resource "aws_network_acl" "terraform_test_public_network_acl" {
  vpc_id = "${aws_vpc.terraform_test_vpc.id}"
  subnet_ids = ["${aws_subnet.terraform_test_public_subnet.id}"]

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
    Name = "${var.public_network_acl_name}"
  }
}

######################################
# NetworkACL(Private)を作成する
######################################
resource "aws_network_acl" "terraform_test_private_network_acl" {
  vpc_id = "${aws_vpc.terraform_test_vpc.id}"
  subnet_ids = ["${aws_subnet.terraform_test_private_subnet.id}"]

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
    Name = "${var.private_network_acl_name}"
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
resource "aws_route_table" "terraform_test_public_route_table" {
  vpc_id = "${aws_vpc.terraform_test_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.terraform_test_igw.id}"
  }

  tags {
    Name = "${var.public_route_table_name}"
  }
}

######################################
# RouteTable（Private）を作成する
######################################
resource "aws_route_table" "terraform_test_private_route_table" {
  vpc_id = "${aws_vpc.terraform_test_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.terraform_test_nat.id}"
  }

#  route {
#    cidr_block = "${var.peer_vpc_cidr}"
#    gateway_id = "${aws_vpc_peering_connection.terraform_test_to_api_connection.id}"
#  }

  tags {
    Name = "${var.private_route_table_name}"
  }
}


######################################
# SubnetRouteTableAssociationを作成する
######################################
resource "aws_route_table_association" "terraform_test_public_association" {
    subnet_id = "${aws_subnet.terraform_test_public_subnet.id}"
    route_table_id = "${aws_route_table.terraform_test_public_route_table.id}"
}

resource "aws_route_table_association" "terraform_test_private_association" {
    subnet_id = "${aws_subnet.terraform_test_private_subnet.id}"
    route_table_id = "${aws_route_table.terraform_test_private_route_table.id}"
}

