#####################################
#Common Settings
#####################################
variable "aws_region" {
    default = "ap-northeast-1"  # デフォルト値を設定
}
variable "region" {}
#variable "peer_region" {}
variable "availability_zone" {}
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
variable "eipalloc_id" {}
variable "nat_gateway_name" {}
variable "public_subnet_cidr" {}
variable "private_subnet_cidr" {}
variable "public_subnet_name" {}
variable "private_subnet_name" {}
variable "public_network_acl_name" {}
variable "private_network_acl_name" {}
variable "public_route_table_name" {}
variable "private_route_table_name" {}

