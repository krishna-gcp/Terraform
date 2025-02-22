terraform {
  cloud {
    organization = "krishnav"

    workspaces {
      name = "terraforms"
    }
  }
}

provider "google" {
  project     = "mydeployments-451712"
  region      = var.region
  credentials = jsondecode(base64decode(var.GOOGLE_CREDENTIALS))
}

resource "google_compute_instance" "vm_instance" {
  name         = "test-vm"
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
