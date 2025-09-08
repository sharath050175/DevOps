provider "aws" {
  region = "ap-south-1"

}
# vpc

resource "aws_vpc" "my_vpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support = true
    tags = {
      Name = "Vpc-Project"

    }

}

#subnet-1
resource "aws-subnet" "subnet-1" {
  vpc-id = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1"
  map_public_ip_on_launch = true
  tags = {
    Name = "Subnet-1"
  }

}
#Subnet-2
resource "aws-subnet" "subnet-2" {
  vpc-id = aws_vpc.my_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-southeast-1"
  map_public_ip_on_launch = true
  tags = {
    Name = "Subnet-2"
  }

}
# Creating Internet Gateway
resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "MyIGW"
  }
  
}

# Creating the Route table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.my_vpc
  tags = {
    Name = "route_table-custom"
  
  }
} 

# Creating the Route
resource "aws_route" "public_route" {
  route_table_id = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.myigw.id
}

#creating the route association

resource "aws_route_table_association" "public_subnet_association" {
  subnet_id = aws_subnet.subnet-1.id
  route_table_id = aws_route_table.public_route_table.id
  
}
