output "instance_id" {
  value = "${google_compute_instance.my-instance.*.self_link}"
}
