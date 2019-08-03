output "image_id" {
    value = "${data.aws_ami.ubuntu_ami.id}"
}
output "current_vpcs" {
  value = "${data.aws_vpcs.current_vpcs.ids}"
}
//output "vpc_details" {
//  value = "${data.aws_vpc.current_vpc.cidr_block}"
//}

output "vpc_count" {
  value = "${data.null_data_source.vpc_count.outputs["vpc_count"]}"
}

output "cidrs" {
  value = "${data.external.priv_subnet_list.result}"
}
