resource "google_compute_instance" "bastion" {
  name         = "bastion-host"
  machine_type = var.bastion_machine
  zone         = var.zone

  tags = ["bastion"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.subnet.id

    access_config {} # Public IP for SSH
  }

  metadata = {
    ssh-keys = "admin:${file("~/.ssh/id_rsa.pub")}"
  }
}
