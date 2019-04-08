provider "google" {
    project = "${var.project_name}"
    region = "${var.region}"
    credentials = "${file("${var.creds}")}"
  
}
