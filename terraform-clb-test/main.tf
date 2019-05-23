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
resource "aws_vpc" "terraform_clb_test1_vpc" {
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
resource "aws_internet_gateway" "terraform_clb_test1_igw" {
  vpc_id = "${aws_vpc.terraform_clb_test1_vpc.id}"

  tags {
    Name = "${var.igw_name}"
  }
}

######################################
# Subnet（Public）を作成する
######################################
resource "aws_subnet" "terraform_clb_test1_public_subnet1a" {
  vpc_id = "${aws_vpc.terraform_clb_test1_vpc.id}"
  cidr_block = "${var.public_subnet_cidr1}"
  availability_zone = "${var.availability_zone1}"

  tags {
    Name = "${var.public_subnet_name1}"
  }
}

resource "aws_subnet" "terraform_clb_test1_public_subnet1c" {
  vpc_id = "${aws_vpc.terraform_clb_test1_vpc.id}"
  cidr_block = "${var.public_subnet_cidr2}"
  availability_zone = "${var.availability_zone2}"

  tags {
    Name = "${var.public_subnet_name2}"
  }
}

######################################
# Subnet（Private）を作成する
######################################
resource "aws_subnet" "terraform_clb_test1_private_subnet1a" {
  vpc_id = "${aws_vpc.terraform_clb_test1_vpc.id}"
  cidr_block = "${var.private_subnet_cidr1}"
  availability_zone = "${var.availability_zone1}"

  tags {
    Name = "${var.private_subnet_name1}"
  }
}

resource "aws_subnet" "terraform_clb_test1_private_subnet1c" {
  vpc_id = "${aws_vpc.terraform_clb_test1_vpc.id}"
  cidr_block = "${var.private_subnet_cidr2}"
  availability_zone = "${var.availability_zone2}"

  tags {
    Name = "${var.private_subnet_name2}"
  }
}

######################################
# NatGatewayを作成する
######################################
resource "aws_nat_gateway" "terraform_clb_test1_nat1" {
  allocation_id = "${var.eipalloc_id1}"
  subnet_id = "${aws_subnet.terraform_clb_test1_public_subnet1a.id}"

  tags {
    Name = "${var.nat_gateway_name1}"
  }
}

resource "aws_nat_gateway" "terraform_clb_test1_nat2" {
  allocation_id = "${var.eipalloc_id2}"
  subnet_id = "${aws_subnet.terraform_clb_test1_public_subnet1c.id}"

  tags {
    Name = "${var.nat_gateway_name2}"
  }
}

######################################
# NetworkACL(Public)を作成する
######################################
resource "aws_network_acl" "terraform_clb_test1_public_network_acl1" {
  vpc_id = "${aws_vpc.terraform_clb_test1_vpc.id}"
  subnet_ids = ["${aws_subnet.terraform_clb_test1_public_subnet1a.id}"]

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

resource "aws_network_acl" "terraform_clb_test1_public_network_acl2" {
  vpc_id = "${aws_vpc.terraform_clb_test1_vpc.id}"
  subnet_ids = ["${aws_subnet.terraform_clb_test1_public_subnet1c.id}"]

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
resource "aws_network_acl" "terraform_clb_test1_private_network_acl1" {
  vpc_id = "${aws_vpc.terraform_clb_test1_vpc.id}"
  subnet_ids = ["${aws_subnet.terraform_clb_test1_private_subnet1a.id}"]

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

resource "aws_network_acl" "terraform_clb_test1_private_network_acl2" {
  vpc_id = "${aws_vpc.terraform_clb_test1_vpc.id}"
  subnet_ids = ["${aws_subnet.terraform_clb_test1_private_subnet1c.id}"]

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
#    vpc_id = "${aws_vpc.terraform_clb_test1_vpc.id}"
#    peer_region ="${var.peer_region}"
#
#    tags {
#        Name = "${var.peering_connection_name}"
#    }
#}

#resource "aws_vpc_peering_connection_accepter" "terraform_clb_test1_to_api_peer_accepter" {
#    provider                  = "aws.peer"
#    vpc_peering_connection_id = "${aws_vpc_peering_connection.terraform_clb_test1_to_api_connection.id}"
#    auto_accept               = true
#}

######################################
# Security Groupを作成する
######################################
resource "aws_security_group" "clb_test_allow_http" {
  name        = "clb_test_allow_http"
  description = "Allow HTTP inbound traffic"
  vpc_id = "${aws_vpc.terraform_clb_test1_vpc.id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "clb_test_allow_http"
  }
}

######################################
# RouteTable（Public）を作成する
######################################
resource "aws_route_table" "terraform_clb_test1_public_route_table1" {
  vpc_id = "${aws_vpc.terraform_clb_test1_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.terraform_clb_test1_igw.id}"
  }

  tags {
    Name = "${var.public_route_table_name1}"
  }
}

resource "aws_route_table" "terraform_clb_test1_public_route_table2" {
  vpc_id = "${aws_vpc.terraform_clb_test1_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.terraform_clb_test1_igw.id}"
  }

  tags {
    Name = "${var.public_route_table_name2}"
  }
}

######################################
# RouteTable（Private）を作成する
######################################
resource "aws_route_table" "terraform_clb_test1_private_route_table1" {
  vpc_id = "${aws_vpc.terraform_clb_test1_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.terraform_clb_test1_nat1.id}"
  }

#  route {
#    cidr_block = "${var.peer_vpc_cidr}"
#    gateway_id = "${aws_vpc_peering_connection.terraform_clb_test1_to_api_connection.id}"
#  }

  tags {
    Name = "${var.private_route_table_name1}"
  }
}


resource "aws_route_table" "terraform_clb_test1_private_route_table2" {
  vpc_id = "${aws_vpc.terraform_clb_test1_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.terraform_clb_test1_nat2.id}"
  }

#  route {
#    cidr_block = "${var.peer_vpc_cidr}"
#    gateway_id = "${aws_vpc_peering_connection.terraform_clb_test1_to_api_connection.id}"
#  }

  tags {
    Name = "${var.private_route_table_name2}"
  }
}

######################################
# SubnetRouteTableAssociationを作成する
######################################
resource "aws_route_table_association" "terraform_clb_test1_public_association1" {
    subnet_id = "${aws_subnet.terraform_clb_test1_public_subnet1a.id}"
    route_table_id = "${aws_route_table.terraform_clb_test1_public_route_table1.id}"
}

resource "aws_route_table_association" "terraform_clb_test1_public_association2" {
    subnet_id = "${aws_subnet.terraform_clb_test1_public_subnet1c.id}"
    route_table_id = "${aws_route_table.terraform_clb_test1_public_route_table2.id}"
}

resource "aws_route_table_association" "terraform_clb_test1_private_association1" {
    subnet_id = "${aws_subnet.terraform_clb_test1_private_subnet1a.id}"
    route_table_id = "${aws_route_table.terraform_clb_test1_private_route_table1.id}"
}

resource "aws_route_table_association" "terraform_clb_test1_private_association2" {
    subnet_id = "${aws_subnet.terraform_clb_test1_private_subnet1c.id}"
    route_table_id = "${aws_route_table.terraform_clb_test1_private_route_table2.id}"
}


######################################
# CLBを作成する
######################################
resource "aws_elb" "terraform-clb-test1" {
  name               = "${var.clb_name}"
  subnets           = ["${aws_subnet.terraform_clb_test1_public_subnet1a.id}","${aws_subnet.terraform_clb_test1_public_subnet1c.id}"]
#  availability_zones = ["${var.availability_zone1}","${var.availability_zone2}"]
  security_groups = ["${aws_security_group.clb_test_allow_http.id}"]

  access_logs {
    bucket        = "${var.clb_s3_bucket}"
    #bucket_prefix = "bar"
    enabled = "${var.clb_access_logs_enabled}"
  }

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  #instances                   = ["${aws_instance.foo.id}"]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "terraform-clb-test1"
  }
}

######################################
# 起動テンプレートを作成する
######################################
resource "aws_launch_template" "terraform_clb_test1_launch_template1" {
  name = "terraform_clb_test1_launch_template1"

  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_size = 8
      volume_type = "gp2"
    }
  }

  image_id = "ami-012b65360eb29c11c"

  vpc_security_group_ids = ["${aws_security_group.clb_test_allow_http.id}"]

  instance_type = "t2.micro"

  key_name = "new_key_pair"
}

######################################
# オートスケーリンググループの作成
######################################
resource "aws_autoscaling_group" "terraform_clb_test1_asg" {
  availability_zones = ["${var.availability_zone1}","${var.availability_zone2}"]
  name = "terraform_clb_test1_asg"
  desired_capacity   = 0
  max_size           = 4
  min_size           = 0
  vpc_zone_identifier = ["${aws_subnet.terraform_clb_test1_private_subnet1a.id}","${aws_subnet.terraform_clb_test1_private_subnet1c.id}"]
  load_balancers = ["${aws_elb.terraform-clb-test1.name}"]
  health_check_type = "EC2"
  health_check_grace_period = 300

  tag {
    key = "Name"
    value = "terraform_clb_test1_asg"
    propagate_at_launch = true
  }

  mixed_instances_policy {

    #起動テンプレートの指定
    launch_template {
      launch_template_specification {
        launch_template_id = "${aws_launch_template.terraform_clb_test1_launch_template1.id}"
      }

    #起動させるインスタンスタイプの種類 
      override {
        instance_type = "t1.micro"
      }
      override {
        instance_type = "t2.micro"
      }
    }

    instances_distribution {
      #オンデマンドの割当戦略
      on_demand_allocation_strategy = "prioritized"

      #初期起動時のオンデマンドインスタンス数の指定
      on_demand_base_capacity = "1"

      #スケーリングするときのオンデマンドインスタンスの比率%（その他はスポットインスタンスとなる）
      on_demand_percentage_above_base_capacity = "0"

      #スポットの配分戦略
      spot_allocation_strategy = "lowest-price"

#      spot_max_price = "on-demand price"

    }
  }
}

######################################
# オートスケーリングポリシーの作成
######################################
resource "aws_autoscaling_policy" "terraform_clb_test1_asg_policy" {
  name                   = "terraform_clb_test1_asg_policy"
  autoscaling_group_name = "${aws_autoscaling_group.terraform_clb_test1_asg.name}"
  policy_type            = "TargetTrackingScaling"

  target_tracking_configuration {
   predefined_metric_specification {
    predefined_metric_type = "ASGAverageCPUUtilization"
    #resource_label = "${aws_alb.terraform-test-alb.arn_suffix}/${aws_alb_target_group.terraform_clb_test1_alb_target_group.arn_suffix}"
   }
  target_value = 30.0
  }
}