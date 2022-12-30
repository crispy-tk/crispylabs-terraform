output "vpc_id" {
  value = aws_vpc.vpc.id
}
output "sn_pub" {
  value = [
    for sn in aws_subnet.sn_pub : sn.id
  ]
}
output "sn_priv" {
  value = [
    for sn in aws_subnet.sn_priv : sn.id
  ]
}