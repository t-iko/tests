#####################################
#Common Settings
#####################################
region = "ap-northeast-1"
#peer_region = "ap-northeast-1"
availability_zone = "ap-northeast-1a"
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
eipalloc_id = "eipalloc-03d827d8b68601f59"
nat_gateway_name = "terraform-test-vpc-nat"
public_subnet_cidr = "10.250.10.0/24"
private_subnet_cidr = "10.250.20.0/24"
public_subnet_name = "terraform-publicsubnet-1a"
private_subnet_name = "terraform-privatesubnet-1a"
public_network_acl_name = "terrafrom-test-publicsubnet-acl"
private_network_acl_name = "terrafrom-test-privatesubnet-acl"
public_route_table_name = "terrafrom-test-publicsubnet-1a-rt"
private_route_table_name = "terrafrom-test-privatesubnet-1a-rt"
