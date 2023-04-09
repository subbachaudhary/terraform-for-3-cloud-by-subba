resource "google_compute_instance" "window-vm" {
  name         = "my-window-vm"
  machine_type = "n2-standard-2"
  zone         = "asia-south1-a"

  tags = ["dev"]

  boot_disk {
    initialize_params {
      image = "windows-2022"
      labels = {
        my_label = "value"
      }
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    network = "gcp-projectdev"
    subnetwork = "gcp-projectdev"

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    foo = "test"
  }

  metadata_startup_script = "echo hi > /test.txt"

}
resource "google_compute_instance" "linux-vm" {
  name         = "my-linux-vm"
  machine_type = "n2-standard-2"
  zone         = "asia-south1-a"

  tags = ["dev"]

  boot_disk {
    initialize_params {
      image = "debian-11-bullseye-v20230306"
      labels = {
        my_label = "value"
      }
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    network = "gcp-projectdev"
    subnetwork = "gcp-projectdev"

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    foo = "test"
  }

  metadata_startup_script = "echo hi > /test.txt"

}