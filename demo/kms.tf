resource "google_kms_key_ring" "keyring" {
  name     = "mysql-keyring"
  location = var.location
}

resource "google_kms_crypto_key" "crypto_key" {
  name            = "mysql-key"
  key_ring        = google_kms_key_ring.keyring.id
  rotation_period = "7776000s" # 90 days
}
