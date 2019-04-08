output "instance_id" {
  value = "${module.compute.instance_id}"
}

output "subnetwork_name" {
  value = "${module.network.subnetwork_name}"
}
