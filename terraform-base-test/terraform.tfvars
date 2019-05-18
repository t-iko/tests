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
vpc_name = "terraform_test_vpc"
vpc_cidr = "10.250.0.0/16"
igw_name = "terraform-test-igw"
eipalloc_id1 = "eipalloc-03d827d8b68601f59"
eipalloc_id2 = "eipalloc-0dac0b58260929e53"
nat_gateway_name1 = "terraform-test-vpc-nat1"
nat_gateway_name2 = "terraform-test-vpc-nat2"
public_subnet_cidr1 = "10.250.10.0/24"
public_subnet_cidr2 = "10.250.30.0/24"
private_subnet_cidr1 = "10.250.20.0/24"
private_subnet_cidr2 = "10.250.40.0/24"
public_subnet_name1 = "terraform-test-publicsubnet-1a"
public_subnet_name2 = "terraform-test-publicsubnet-1c"
private_subnet_name1 = "terraform-test-privatesubnet-1a"
private_subnet_name2 = "terraform-test-privatesubnet-1c"
public_network_acl_name1 = "terrafrom-test-publicsubnet-acl1"
public_network_acl_name2 = "terrafrom-test-publicsubnet-acl2"
private_network_acl_name1 = "terrafrom-test-privatesubnet-acl1"
private_network_acl_name2 = "terrafrom-test-privatesubnet-acl2"
public_route_table_name1 = "terrafrom-test-publicsubnet-1a-rt"
public_route_table_name2 = "terrafrom-test-publicsubnet-1c-rt"
private_route_table_name1 = "terrafrom-test-privatesubnet-1a-rt"
private_route_table_name2 = "terrafrom-test-privatesubnet-1c-rt"