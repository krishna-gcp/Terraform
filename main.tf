terraform {
  cloud {
    organization = "krishnav"

    workspaces {
      name = "terraforms"
    }
  }
}

provider "google" {
  project = "mydeployments-451712"
  region  = "us-central1"
  credentials = jsondecode(base64decode(var.gcp_credentials))
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

    access_config {
      // Ephemeral public IP
    }
  }
}

variable "gcp_credentials" {
  description = "Base64-encoded GCP service account key"
}

output "instance_name" {
  value = google_compute_instance.vm_instance.name
}
