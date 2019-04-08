resource "random_id" "instnace-id" {
  byte_length = 2
}

resource "google_compute_instance" "my-instance" {
    count = 2
    name = "${var.instance_name}-${count.index}"
    machine_type = "${var.instance_size}"
    zone = "${var.instance_zone}"

    tags = [
    "${var.tprv_id}-firewall-ssh",
    "${var.tprv_id}-firewall-http",
    "${var.tprv_id}-firewall-https",
    "${var.tprv_id}-firewall-icmp",
    "${var.tprv_id}-firewall-snmp",
    ]
    boot_disk {
        initialize_params {
            image = "${var.image_name}"
            size = "30"
        }
    }
  


network_interface {
    #subnetwork = "${var.subnetwork_name}"
    subnetwork = "${var.subnetwork_name}"
    access_config {}
}

service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
}

}
