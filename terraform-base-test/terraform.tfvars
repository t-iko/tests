#####################################
#Common Settings
#####################################
region = "ap-northeast-1"
#peer_region = "ap-northeast-1"
availability_zone1 = "ap-northeast-1a"
availability_zone2 = "ap-northeast-1c"
env = "ikomat_dev"

#####################################
#VPC Peering Settings（terrafrom-test-vpc[Osaka] to longtest-api-vpc[Tokyo]）
#####################################
#peer_vpc_id = "vpc-XXXXX"
#peer_vpc_cidr = "10.110.0.0/16"
#peering_connection_name = "terrafrom-test-to-api"

#####################################
#VPC Settings
#####################################
vpc_name = "terraform_test1_vpc"
vpc_cidr = "10.240.0.0/16"
igw_name = "terraform-test1-igw"
eipalloc_id1 = "eipalloc-0d56dde89d0ad2d33"
eipalloc_id2 = "eipalloc-0ec5a8e73681d0c7b"
nat_gateway_name1 = "terraform-test1-vpc-nat1"
nat_gateway_name2 = "terraform-test1-vpc-nat2"
public_subnet_cidr1 = "10.240.10.0/24"
public_subnet_cidr2 = "10.240.30.0/24"
private_subnet_cidr1 = "10.240.20.0/24"
private_subnet_cidr2 = "10.240.40.0/24"
public_subnet_name1 = "terraform-test1-publicsubnet-1a"
public_subnet_name2 = "terraform-test1-publicsubnet-1c"
private_subnet_name1 = "terraform-test1-privatesubnet-1a"
private_subnet_name2 = "terraform-test1-privatesubnet-1c"
public_network_acl_name1 = "terrafrom-test-publicsubnet-acl1"
public_network_acl_name2 = "terrafrom-test-publicsubnet-acl2"
private_network_acl_name1 = "terrafrom-test-privatesubnet-acl1"
private_network_acl_name2 = "terrafrom-test-privatesubnet-acl2"
public_route_table_name1 = "terrafrom-test-publicsubnet-1a-rt"
public_route_table_name2 = "terrafrom-test-publicsubnet-1c-rt"
private_route_table_name1 = "terrafrom-test-privatesubnet-1a-rt"
private_route_table_name2 = "terrafrom-test-privatesubnet-1c-rt"


#####################################
#ALB Settings
#####################################
alb_name = "terraform-test1-alb"
alb_internal_enabled = "false"

#alb_security_groups = ["sg-XXXXXXX","sg-XXXXXXX","sg-XXXXXXX"]
#$alb_subnets = ["subnet-XXXXXXX","subnet-XXXXXXX"]
alb_s3_bucket = "terraform-test1-alb-logs"
alb_access_logs_enabled = "false"
alb_vpc = "vpc-XXXXX"


######################################
#ALB Target Group
######################################
alb_tg_name = "tg-group-terraform-test1"
alb_tg_port = "80"
alb_tg_protocol = "HTTP"
alb_tg_health_check_path = "/"
alb_tg_health_check_port = "80"
alb_tg_health_check_protocol = "HTTP"

######################################
# ALB Listener
######################################
alb_listener_port = "80"
alb_listener_protocol = "HTTP"
#alb_listener_ssl_policy = "ELBSecurityPolicy-TLS-1-2-Ext-XXXXXXXX"
#alb_listener_certificate_arn = "arn:aws:acm:ap-northeast-1:XXXXXX:certificate/XXXXXX"XXXXXXXX