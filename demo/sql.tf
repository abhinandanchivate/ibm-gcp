resource "google_sql_database_instance" "mysql" {
  name             = var.db_name
  database_version = "MYSQL_8_0"
  region           = var.region

  depends_on = [
    google_service_networking_connection.private_vpc_connection
  ]

  settings {
    tier = var.db_tier

    ip_configuration {
      ipv4_enabled    = false
      private_network = google_compute_network.vpc.id
    }

    backup_configuration {
      enabled            = true
      binary_log_enabled = true
      start_time         = "02:00"
    }

    availability_type = "REGIONAL"
    disk_type         = "PD_SSD"
    disk_size         = 50
    disk_autoresize   = true

    maintenance_window {
      day  = 7
      hour = 3
    }
  }

  encryption_key_name = google_kms_crypto_key.crypto_key.id
}

resource "google_sql_user" "user" {
  name     = "appuser"
  instance = google_sql_database_instance.mysql.name
  password = var.db_password
}
