terraform {
  required_version = ">= 1.7.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.0"
    }

    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 5.0"
    }
  }

  # ------------ Remote State Backend (Mandatory) ------------
  backend "gcs" {
    bucket = "YOUR_TF_STATE_BUCKET"   # e.g., gcp-tf-state-12345
    prefix = "mysql/state"
  }
}

# ------------ Provider Block (Global) ------------
provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

provider "google-beta" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}
