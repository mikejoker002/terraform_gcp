#provider "google" {}

module "network" {
  source = "./network"
  test_vpc = "${var.test_vpc}"
  tprv_id = "${var.tprv_id}"
  tprv_cidr_range1 = "${var.tprv_cidr_range1}"
  tprv_second_id = "${var.tprv_second_id}"
  tprv_sec_range = "${var.tprv_sec_range}"
  region = "${var.region}"

  
}

module "compute" {
  source = "./compute"
  instance_name = "${var.instance_name}"
  instance_size = "${var.instance_size}"
  instance_zone = "${var.instance_zone}"
  image_name = "${var.image_name}"
  tprv_id = "${var.tprv_id}"
  
  subnetwork_name = "${module.network.subnetwork_name}"

}

