###########################################
# SSH to Bastion Host
###########################################
resource "google_compute_firewall" "allow_ssh_bastion" {
  name    = "allow-ssh-to-bastion"
  network = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]  # Only if bastion is public

  target_tags = ["bastion"]
}

###########################################
# MySQL Private Access from Subnet
###########################################
resource "google_compute_firewall" "allow_mysql" {
  name    = "allow-mysql-private"
  network = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports    = ["3306"]
  }

  source_ranges = [var.subnet_cidr]  # Only apps in subnet can access

  direction = "INGRESS"
}

###########################################
# Internal VPC Communication
###########################################
resource "google_compute_firewall" "allow_internal" {
  name    = "allow-internal"
  network = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }

  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }

  allow {
    protocol = "icmp"
  }

  source_ranges = ["10.0.0.0/8"]  # All internal networks
}
