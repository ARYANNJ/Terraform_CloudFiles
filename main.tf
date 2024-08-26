provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "TerraformVPC" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "TerraformVPC"
  }
}
# resource "aws_s3_bucket" "s3terraformstatebucket" {
#   bucket = "s3terraformstatebucket"
#   tags = {
#     Name = "s3terraformstatebucket"
#   }
# }
# resource "aws_subnet" "TerPublicSubnet" {
#   cidr_block              = var.Public_subnet_cidr
#   vpc_id                  = aws_vpc.TerraformVPC.id
#   map_public_ip_on_launch = true
#   tags = {
#     Name = "TerPublicSubnet"
#   }
#   depends_on = [aws_vpc.TerraformVPC]
# }
# resource "aws_subnet" "TerPrivateSubnet" {
#   cidr_block = var.Private_subnet_cidr
#   vpc_id     = aws_vpc.TerraformVPC.id
#   tags = {
#     Name = "TerPrivateSubnet"
#   }
#   depends_on = [aws_vpc.TerraformVPC]
# }
# resource "aws_internet_gateway" "TerIGW" {
#   vpc_id = aws_vpc.TerraformVPC.id
#   tags = {
#     Name = "TerIGW"
#   }
# }
# resource "aws_nat_gateway" "TerNatGateway" {
#   allocation_id = "eipalloc-074e8fb33d740ea6a"
#   subnet_id     = aws_subnet.TerPublicSubnet.id
#   tags = {
#     Name = "TerNagGateway"
#   }
#   depends_on = [aws_internet_gateway.TerIGW]
# }

# resource "aws_route_table" "TerPubicRouteTable" {
#   vpc_id = aws_vpc.TerraformVPC.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.TerIGW.id
#   }
#   depends_on = [aws_internet_gateway.TerIGW]
# }

# resource "aws_route_table_association" "a" {
#   route_table_id = aws_route_table.TerPubicRouteTable.id
#   subnet_id      = aws_subnet.TerPublicSubnet.id

#   depends_on = [aws_route_table.TerPubicRouteTable]
# }

# resource "aws_route_table" "TerPrivateRouteTable" {
#   vpc_id = aws_vpc.TerraformVPC.id
#   route {
#     cidr_block     = "0.0.0.0/0"
#     nat_gateway_id = aws_nat_gateway.TerNatGateway.id
#   }
#   depends_on = [aws_nat_gateway.TerNatGateway]
# }

# resource "aws_route_table_association" "name" {
#   route_table_id = aws_route_table.TerPrivateRouteTable.id
#   subnet_id      = aws_subnet.TerPrivateSubnet.id
#   depends_on     = [aws_route_table.TerPrivateRouteTable]
# }

# resource "aws_security_group" "TerFrontendSG" {
#   name        = "TerFrontendSG"
#   description = "Security Group for Frontend"
#   vpc_id      = aws_vpc.TerraformVPC.id

#   tags = {
#     Name = "TerFrontendSG"
#   }
# }
# resource "aws_vpc_security_group_ingress_rule" "http" {
#   security_group_id = aws_security_group.TerFrontendSG.id
#   from_port         = 80
#   ip_protocol       = "tcp"
#   cidr_ipv4         = "0.0.0.0/0"
#   to_port           = 80
# }
# resource "aws_vpc_security_group_ingress_rule" "https" {
#   security_group_id = aws_security_group.TerFrontendSG.id
#   from_port         = 443
#   ip_protocol       = "tcp"
#   cidr_ipv4         = "0.0.0.0/0"
#   to_port           = 443
# }
# resource "aws_vpc_security_group_ingress_rule" "ssh" {
#   security_group_id = aws_security_group.TerFrontendSG.id
#   from_port         = 22
#   ip_protocol       = "tcp"
#   cidr_ipv4         = "0.0.0.0/0"
#   to_port           = 22
# }

# resource "aws_security_group_rule" "alloutbound" {
#   type              = "egress"
#   security_group_id = aws_security_group.TerFrontendSG.id
#   from_port         = 0
#   to_port           = 0
#   protocol          = "-1"
#   cidr_blocks       = ["0.0.0.0/0"]
# }
# resource "aws_security_group" "Terbackendsg" {
#   vpc_id      = aws_vpc.TerraformVPC.id
#   name        = "Terbackendsg"
#   description = "This is a security group for backend"
#   tags = {
#     Name = "Terbackendsg"
#   }
# }
# resource "aws_vpc_security_group_ingress_rule" "ssh1" {
#   security_group_id = aws_security_group.Terbackendsg.id
#   to_port           = 22
#   from_port         = 22
#   cidr_ipv4         = "0.0.0.0/0"
#   ip_protocol       = "tcp"
# }
# resource "aws_vpc_security_group_ingress_rule" "http1" {
#   security_group_id = aws_security_group.Terbackendsg.id
#   to_port           = 80
#   from_port         = 80
#   cidr_ipv4         = "0.0.0.0/0"
#   ip_protocol       = "tcp"
# }
# resource "aws_vpc_security_group_ingress_rule" "https2" {
#   security_group_id = aws_security_group.Terbackendsg.id
#   to_port           = 443
#   from_port         = 443
#   ip_protocol       = "tcp"
#   cidr_ipv4         = "0.0.0.0/0"
# }
# resource "aws_vpc_security_group_ingress_rule" "custom8000" {
#   security_group_id = aws_security_group.Terbackendsg.id
#   to_port           = 8000
#   from_port         = 8000
#   cidr_ipv4         = "0.0.0.0/0"
#   ip_protocol       = "tcp"
# }

# resource "aws_security_group_rule" "alloutbound2" {
#   type              = "egress"
#   security_group_id = aws_security_group.Terbackendsg.id
#   from_port         = 0
#   to_port           = 0
#   protocol          = "-1"
#   cidr_blocks       = ["0.0.0.0/0"]
# }

# resource "aws_security_group" "Terdatabasesg" {
#   name        = "Terdatabasesg"
#   description = "This is security group for database "
#   vpc_id      = aws_vpc.TerraformVPC.id
#   tags = {
#     Name = "Terdatabasesg"
#   }
# }

# resource "aws_security_group_rule" "ssh3" {
#   type              = "ingress"
#   protocol          = "tcp"
#   to_port           = 22
#   from_port         = 22
#   cidr_blocks       = ["0.0.0.0/0"]
#   security_group_id = aws_security_group.Terdatabasesg.id
# }
# resource "aws_security_group_rule" "sql" {
#   security_group_id = aws_security_group.Terdatabasesg.id
#   type              = "ingress"
#   to_port           = 3306
#   from_port         = 3306
#   cidr_blocks       = ["0.0.0.0/0"]
#   protocol          = "tcp"
# }

# resource "aws_security_group_rule" "outbound3" {
#   type              = "egress"
#   security_group_id = aws_security_group.Terdatabasesg.id
#   to_port           = 0
#   from_port         = 0
#   protocol          = "-1"
#   cidr_blocks       = ["0.0.0.0/0"]
# }

# resource "aws_instance" "Terfrontendinstance" {
#   ami                    = "ami-0d0c3fc16533f895a"
#   key_name               = "aws-key"
#   instance_type          = "t2.micro"
#   subnet_id              = aws_subnet.TerPublicSubnet.id
#   vpc_security_group_ids = [aws_security_group.TerFrontendSG.id]
#   tags = {
#     Name = "Ter_frontend_instance"
#   }
# }
# resource "aws_instance" "Terbackendinstance" {
#   ami                    = "ami-05f2cabcca9dbf290"
#   key_name               = "aws-key"
#   instance_type          = "t2.micro"
#   subnet_id              = aws_subnet.TerPrivateSubnet.id
#   vpc_security_group_ids = [aws_security_group.TerFrontendSG.id]
#   tags = {
#     Name = "Ter_backend_instance"
#   }
# }
# resource "aws_instance" "Terdatabaseinstance" {
#   ami                    = "ami-04b261c4dcb1a1a00"
#   key_name               = "aws-key"
#   instance_type          = "t2.micro"
#   subnet_id              = aws_subnet.TerPrivateSubnet.id
#   vpc_security_group_ids = [aws_security_group.TerFrontendSG.id]
#   tags = {
#     Name = "Ter_database_instance"
#   }
# }

