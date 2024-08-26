output "vpc_id" {
  value = aws_vpc.TerraformVPC.id
}
# output "bucket_id" {
#   value = aws_s3_bucket.s3terraformstatebucket.id
# }
# output "TerPublicSubnet_id" {
#   value = aws_subnet.TerPublicSubnet.id
# }
# output "TerPrivateSubnet_id" {
#   value = aws_subnet.TerPrivateSubnet.id
# }
# output "TerIGW_id" {
#   value = aws_internet_gateway.TerIGW.id
# }

# output "aws_nat_gateway" {
#   value = aws_nat_gateway.TerNatGateway.id
# }
# output "TerPubicRouteTable" {
#   value = aws_route_table.TerPubicRouteTable.id
# }
# output "TerPrivateRouteTable" {
#   value = aws_route_table.TerPrivateRouteTable.id
# }
# output "frontend_security_group_id" {
#   value = aws_security_group.TerFrontendSG.id
# }

# output "backend_security_group_id" {
#   value = aws_security_group.Terbackendsg.id
# }
# output "database_security_group_id" {
#   value = aws_security_group.Terdatabasesg.id
# }
# output "frontend_instance" {
#   value = aws_instance.Terfrontendinstance.id
# }
# output "backend_instance" {
#   value = aws_instance.Terbackendinstance.id
# }
# output "database_instance" {
#   value = aws_instance.Terdatabaseinstance.id
# }
