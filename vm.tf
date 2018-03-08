resource "google_compute_instance" "default" {
  name         = "test-vm"
  machine_type = "n1-standard-1"
  zone         = "europe-west1-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-8"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Use Ephemeral IP
    }
  }

  metadata {
    ssh-keys = "debian:${file("~/.ssh/id_rsa.pub")}"
  }
}
