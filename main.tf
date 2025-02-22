terraform {
  cloud {
    organization = "Krishnav"

    workspaces {
      name = "Terraform"
    }
  }
}

provider "google" {
  project     = var.project_id
  region      = var.region
  credentials = file("key.json")
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
