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
#clb Settings
#####################################
variable "clb_name" {}
variable "clb_internal_enabled" {}
variable "clb_s3_bucket" {}
variable "clb_access_logs_enabled" {}