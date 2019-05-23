#####################################
#Common Settings
#####################################
region = "ap-northeast-1"
#peer_region = "ap-northeast-1"
availability_zone1 = "ap-northeast-1a"
availability_zone2 = "ap-northeast-1c"
env = "ikomat_dev"

#####################################
#VPC Peering Settings（terrafrom-clb-test1-vpc[Osaka] to longtest-api-vpc[Tokyo]）
#####################################
#peer_vpc_id = "vpc-XXXXX"
#peer_vpc_cidr = "10.110.0.0/16"
#peering_connection_name = "terrafrom-clb-test1-to-api"

#####################################
#VPC Settings
#####################################
vpc_name = "terraform_clb_test1_vpc"
vpc_cidr = "10.230.0.0/16"
igw_name = "terraform-clb-test1-igw"
eipalloc_id1 = "eipalloc-0ec5a8e73681d0c7b"
eipalloc_id2 = "eipalloc-0d56dde89d0ad2d33"
nat_gateway_name1 = "terraform-clb-test1-vpc-nat1"
nat_gateway_name2 = "terraform-clb-test1-vpc-nat2"
public_subnet_cidr1 = "10.230.10.0/24"
public_subnet_cidr2 = "10.230.30.0/24"
private_subnet_cidr1 = "10.230.20.0/24"
private_subnet_cidr2 = "10.230.40.0/24"
public_subnet_name1 = "terraform-clb-test1-publicsubnet-1a"
public_subnet_name2 = "terraform-clb-test1-publicsubnet-1c"
private_subnet_name1 = "terraform-clb-test1-privatesubnet-1a"
private_subnet_name2 = "terraform-clb-test1-privatesubnet-1c"
public_network_acl_name1 = "terrafrom-clb-test1-publicsubnet-acl1"
public_network_acl_name2 = "terrafrom-clb-test1-publicsubnet-acl2"
private_network_acl_name1 = "terrafrom-clb-test1-privatesubnet-acl1"
private_network_acl_name2 = "terrafrom-clb-test1-privatesubnet-acl2"
public_route_table_name1 = "terrafrom-clb-test1-publicsubnet-1a-rt"
public_route_table_name2 = "terrafrom-clb-test1-publicsubnet-1c-rt"
private_route_table_name1 = "terrafrom-clb-test1-privatesubnet-1a-rt"
private_route_table_name2 = "terrafrom-clb-test1-privatesubnet-1c-rt"


#####################################
#clb Settings
#####################################
clb_name = "terraform-clb-test1"
clb_internal_enabled = "false"

#clb_security_groups = ["sg-XXXXXXX","sg-XXXXXXX","sg-XXXXXXX"]
#$clb_subnets = ["subnet-XXXXXXX","subnet-XXXXXXX"]
clb_s3_bucket = "terraform-clb-test1-logs"
clb_access_logs_enabled = "false"
#clb_vpc = "vpc-XXXXX"




#EIPは手動で用意