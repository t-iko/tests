#####################################
#Common Settings
#####################################
variable "aws_region" {
    default = "ap-northeast-1"  # デフォルト値を設定
}
variable "region" {}
#variable "peer_region" {}
variable "availability_zone1" {}
variable "availability_zone2" {}
variable "env" {}

#####################################
#VPC Peering Settings
#####################################
#variable "peer_vpc_id" {}
#variable "peer_vpc_cidr" {}
#variable "peering_connection_name" {}

#####################################
#VPC Settings
#####################################
variable "vpc_name" {}
variable "vpc_cidr" {}
variable "igw_name" {}
variable "eipalloc_id1" {}
variable "eipalloc_id2" {}
variable "nat_gateway_name1" {}
variable "nat_gateway_name2" {}
variable "public_subnet_cidr1" {}
variable "public_subnet_cidr2" {}
variable "private_subnet_cidr1" {}
variable "private_subnet_cidr2" {}
variable "public_subnet_name1" {}
variable "public_subnet_name2" {}
variable "private_subnet_name1" {}
variable "private_subnet_name2" {}
variable "public_network_acl_name1" {}
variable "public_network_acl_name2" {}
variable "private_network_acl_name1" {}
variable "private_network_acl_name2" {}
variable "public_route_table_name1" {}
variable "public_route_table_name2" {}
variable "private_route_table_name1" {}
variable "private_route_table_name2" {}

#####################################
#ALB Settings
#####################################
variable "alb_name" {}
variable "alb_internal_enabled" {}
variable "alb_s3_bucket" {}
variable "alb_access_logs_enabled" {}
variable "alb_vpc" {}
variable "alb_tg_name" {}
variable "alb_tg_port" {}
variable "alb_tg_protocol" {}
variable "alb_tg_health_check_path" {}
variable "alb_tg_health_check_port" {}
variable "alb_tg_health_check_protocol" {}
variable "alb_listener_port" {}
variable "alb_listener_protocol" {}