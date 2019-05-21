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
resource "aws_vpc" "terraform_test1_vpc" {
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
resource "aws_internet_gateway" "terraform_test1_igw" {
  vpc_id = "${aws_vpc.terraform_test1_vpc.id}"

  tags {
    Name = "${var.igw_name}"
  }
}

######################################
# Subnet（Public）を作成する
######################################
resource "aws_subnet" "terraform_test1_public_subnet1a" {
  vpc_id = "${aws_vpc.terraform_test1_vpc.id}"
  cidr_block = "${var.public_subnet_cidr1}"
  availability_zone = "${var.availability_zone1}"

  tags {
    Name = "${var.public_subnet_name1}"
  }
}

resource "aws_subnet" "terraform_test1_public_subnet1c" {
  vpc_id = "${aws_vpc.terraform_test1_vpc.id}"
  cidr_block = "${var.public_subnet_cidr2}"
  availability_zone = "${var.availability_zone2}"

  tags {
    Name = "${var.public_subnet_name2}"
  }
}

######################################
# Subnet（Private）を作成する
######################################
resource "aws_subnet" "terraform_test1_private_subnet1a" {
  vpc_id = "${aws_vpc.terraform_test1_vpc.id}"
  cidr_block = "${var.private_subnet_cidr1}"
  availability_zone = "${var.availability_zone1}"

  tags {
    Name = "${var.private_subnet_name1}"
  }
}

resource "aws_subnet" "terraform_test1_private_subnet1c" {
  vpc_id = "${aws_vpc.terraform_test1_vpc.id}"
  cidr_block = "${var.private_subnet_cidr2}"
  availability_zone = "${var.availability_zone2}"

  tags {
    Name = "${var.private_subnet_name2}"
  }
}

######################################
# NatGatewayを作成する
######################################
resource "aws_nat_gateway" "terraform_test1_nat1" {
  allocation_id = "${var.eipalloc_id1}"
  subnet_id = "${aws_subnet.terraform_test1_public_subnet1a.id}"

  tags {
    Name = "${var.nat_gateway_name1}"
  }
}

resource "aws_nat_gateway" "terraform_test1_nat2" {
  allocation_id = "${var.eipalloc_id2}"
  subnet_id = "${aws_subnet.terraform_test1_public_subnet1c.id}"

  tags {
    Name = "${var.nat_gateway_name2}"
  }
}

######################################
# NetworkACL(Public)を作成する
######################################
resource "aws_network_acl" "terraform_test1_public_network_acl1" {
  vpc_id = "${aws_vpc.terraform_test1_vpc.id}"
  subnet_ids = ["${aws_subnet.terraform_test1_public_subnet1a.id}"]

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

resource "aws_network_acl" "terraform_test1_public_network_acl2" {
  vpc_id = "${aws_vpc.terraform_test1_vpc.id}"
  subnet_ids = ["${aws_subnet.terraform_test1_public_subnet1c.id}"]

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
resource "aws_network_acl" "terraform_test1_private_network_acl1" {
  vpc_id = "${aws_vpc.terraform_test1_vpc.id}"
  subnet_ids = ["${aws_subnet.terraform_test1_private_subnet1a.id}"]

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

resource "aws_network_acl" "terraform_test1_private_network_acl2" {
  vpc_id = "${aws_vpc.terraform_test1_vpc.id}"
  subnet_ids = ["${aws_subnet.terraform_test1_private_subnet1c.id}"]

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
#    vpc_id = "${aws_vpc.terraform_test1_vpc.id}"
#    peer_region ="${var.peer_region}"
#
#    tags {
#        Name = "${var.peering_connection_name}"
#    }
#}

#resource "aws_vpc_peering_connection_accepter" "terraform_test1_to_api_peer_accepter" {
#    provider                  = "aws.peer"
#    vpc_peering_connection_id = "${aws_vpc_peering_connection.terraform_test1_to_api_connection.id}"
#    auto_accept               = true
#}

######################################
# RouteTable（Public）を作成する
######################################
resource "aws_route_table" "terraform_test1_public_route_table1" {
  vpc_id = "${aws_vpc.terraform_test1_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.terraform_test1_igw.id}"
  }

  tags {
    Name = "${var.public_route_table_name1}"
  }
}

resource "aws_route_table" "terraform_test1_public_route_table2" {
  vpc_id = "${aws_vpc.terraform_test1_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.terraform_test1_igw.id}"
  }

  tags {
    Name = "${var.public_route_table_name2}"
  }
}

######################################
# RouteTable（Private）を作成する
######################################
resource "aws_route_table" "terraform_test1_private_route_table1" {
  vpc_id = "${aws_vpc.terraform_test1_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.terraform_test1_nat1.id}"
  }

#  route {
#    cidr_block = "${var.peer_vpc_cidr}"
#    gateway_id = "${aws_vpc_peering_connection.terraform_test1_to_api_connection.id}"
#  }

  tags {
    Name = "${var.private_route_table_name1}"
  }
}


resource "aws_route_table" "terraform_test1_private_route_table2" {
  vpc_id = "${aws_vpc.terraform_test1_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.terraform_test1_nat2.id}"
  }

#  route {
#    cidr_block = "${var.peer_vpc_cidr}"
#    gateway_id = "${aws_vpc_peering_connection.terraform_test1_to_api_connection.id}"
#  }

  tags {
    Name = "${var.private_route_table_name2}"
  }
}

######################################
# SubnetRouteTableAssociationを作成する
######################################
resource "aws_route_table_association" "terraform_test1_public_association1" {
    subnet_id = "${aws_subnet.terraform_test1_public_subnet1a.id}"
    route_table_id = "${aws_route_table.terraform_test1_public_route_table1.id}"
}

resource "aws_route_table_association" "terraform_test1_public_association2" {
    subnet_id = "${aws_subnet.terraform_test1_public_subnet1c.id}"
    route_table_id = "${aws_route_table.terraform_test1_public_route_table2.id}"
}

resource "aws_route_table_association" "terraform_test1_private_association1" {
    subnet_id = "${aws_subnet.terraform_test1_private_subnet1a.id}"
    route_table_id = "${aws_route_table.terraform_test1_private_route_table1.id}"
}

resource "aws_route_table_association" "terraform_test1_private_association2" {
    subnet_id = "${aws_subnet.terraform_test1_private_subnet1c.id}"
    route_table_id = "${aws_route_table.terraform_test1_private_route_table2.id}"
}


######################################
# ALBを作成する
######################################
resource "aws_alb" "terraform-test-alb" {
  name               = "${var.alb_name}"
  internal           = "${var.alb_internal_enabled}"
  load_balancer_type = "application"
  #security_groups    = ["${aws_security_group.terraform-test-alb.id}"]
  subnets            = ["${aws_subnet.terraform_test1_public_subnet1a.id}","${aws_subnet.terraform_test1_public_subnet1c.id}"]

  #idle_timeout               = 60 
  #enable_deletion_protection = true
  #enable_http2               = true
  ip_address_type            = "ipv4"

  access_logs {
    bucket  = "${var.alb_s3_bucket}"
    #prefix  = "${var.alb_name}"
    enabled = "${var.alb_access_logs_enabled}"
  }

  tags {
    Name = "${var.alb_name}"
  }
}

######################################
# ALBターゲットグループを作成する
######################################
resource "aws_alb_target_group" "terraform_test1_alb_target_group" {
  name     = "${var.alb_tg_name}"
  port     = "${var.alb_tg_port}"
  protocol = "${var.alb_tg_protocol}"
  vpc_id   = "${aws_vpc.terraform_test1_vpc.id}"
  deregistration_delay = 120

  health_check {
    interval             = 30
    path                 = "${var.alb_tg_health_check_path}"
    port                 = "${var.alb_tg_health_check_port}"
    protocol             = "${var.alb_tg_health_check_protocol}"
    timeout              = 5
    healthy_threshold    = 2
    unhealthy_threshold  = 3
    matcher              = "200"
  }
}

######################################
# ALBリスナーを作成する
######################################
resource "aws_alb_listener" "terraform_test1_alb_listener" {
  load_balancer_arn = "${aws_alb.terraform-test-alb.arn}"
  port              = "${var.alb_listener_port}"
  protocol          = "${var.alb_listener_protocol}"
  #ssl_policy        = "${var.alb_listener_ssl_policy}"
  #certificate_arn   = "${var.alb_listener_certificate_arn}"

  default_action {
    target_group_arn = "${aws_alb_target_group.terraform_test1_alb_target_group.arn}"
    type             = "forward"
  }
}

######################################
# 起動テンプレートを作成する(変数宣言なし)
######################################
resource "aws_launch_template" "terraform_test1_launch_template" {
  name = "terraform_test1_launch_template"

  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_size = 8
      volume_type = "gp2"
    }
  }

##  capacity_reservation_specification {
##    capacity_reservation_preference = "open"
##  }

##  credit_specification {
##    cpu_credits = "standard"
##  }

##  disable_api_termination = true

##  ebs_optimized = true

##  elastic_gpu_specifications {
##    type = "test"
##  }

##  elastic_inference_accelerator {
##    type = "eia1.medium"
##  }

##  iam_instance_profile {
##    name = "test"
##  }

  image_id = "ami-012b65360eb29c11c"

##  instance_initiated_shutdown_behavior = "terminate"

##  instance_market_options {
##    market_type = "spot"
##  }

  instance_type = "t2.micro"

##  kernel_id = "test"

  key_name = "new_key_pair"

##  license_specification {
##    license_configuration_arn = "arn:aws:license-manager:eu-west-1:123456789012:license-configuration:lic-0123456789abcdef0123456789abcdef"
##  }

##  monitoring {
##    enabled = true
##  }

##  network_interfaces {
##    associate_public_ip_address = true
##  }

##  placement {
##    availability_zone = "us-west-2a"
##  }

##  ram_disk_id = "test"

##  vpc_security_group_ids = ["sg-12345678"]

##  tag_specifications {
##    resource_type = "instance"

##    tags = {
##      Name = "test"
##    }
##  }

##  user_data = "${base64encode(...)}"
}



