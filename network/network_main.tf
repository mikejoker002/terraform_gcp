######### network/main.tf######
resource "google_compute_network" "test_vpc" {
    name = "${var.test_vpc}"
    auto_create_subnetworks = false
  
}

resource "google_compute_subnetwork" "test_private" {
    name = "${var.tprv_id}"
    ip_cidr_range = "${var.tprv_cidr_range1}"
    region = "${var.region}"
    network = "${google_compute_network.test_vpc.self_link}"
    #secondary_ip_range {
     #   range_name = "${var.tprv_second_id}"
      #  ip_cidr_range = "${var.tprv_sec_range}"
    #} 
}

resource "google_compute_firewall" "ssh" {
  name = "${var.tprv_id}-firewall-ssh"
  network = "${google_compute_network.test_vpc.name}"

  allow {
      protocol = "tcp"
      ports = ["22"]
    }
    target_tags = ["${var.tprv_id}-firewall-ssh"]
    source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "http" {
    name = "${var.tprv_id}-firewall-http"
    network = "${google_compute_network.test_vpc.name}"

    allow {
        protocol = "tcp"
        ports = ["80"]
    }
    target_tags = ["${var.tprv_id}-firewall-http"]
    source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "snmp" {
    name = "${var.tprv_id}-firewall-snmp"
    network = "${google_compute_network.test_vpc.name}"

    allow {
        protocol ="udp"
        ports = ["161"]

    }
    target_tags = ["${var.tprv_id}-firewall-snmp"]
    source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "icmp" {
    name = "${var.tprv_id}-firewall-icmp"
    network = "${google_compute_network.test_vpc.name}"

    allow {
        protocol = "icmp"
    }
    target_tags = ["${var.tprv_id}-firewall-icmp"]
    source_ranges = ["0.0.0.0/0"]
}


