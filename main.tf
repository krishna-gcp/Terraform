terraform {
  cloud {
    organization = "Krishnav"

    workspaces {
      name = "Terraforms"
    }
  }
}

provider "google" {
  credentials = jsondecode(base64decode(var.google_credentials))
  project     = var.project
  region      = var.gcr_region
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-vm"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}
