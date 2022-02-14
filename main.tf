provider "google" {
    credentials = file("gcp-creds.json")
    project = "gcp-kafka"
    region = "europe-west3"
    zone = "europe-west3-c"
}
resource "google_compute_disk" "volumes" {
  for_each = var.instances
  name  =format("%s-%s",each.value["name"],"volume")
  type  = "pd-ssd"
  size = each.value["disk_size"]
  labels = {
    environment = "demo"
  }
  physical_block_size_bytes = 4096
}
resource "google_compute_attached_disk" "volumes" {
for_each = var.instances

  disk     = format("%s-%s",each.value["name"],"volume")
  instance = each.value["name"]

}

resource "google_compute_instance" "challenge_instance" {
    
    for_each = var.instances
    name = each.value["name"]
    machine_type = each.value["instance_type"]
    metadata = {
    ssh-keys = "${var.ssh_user}:${file(var.pub_key_file)}"
  }
    boot_disk {
        initialize_params {
            image = "debian-cloud/debian-9"
        }
    }
    network_interface {
        network = "default"
        access_config{}
    }
}
