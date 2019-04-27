resource "digitalocean_droplet" "droplet1" {
  image = "ubuntu-16-04-x64"
  name = "droplet1"
  region = "sgp1"
  size = "512mb"
  private_networking = true
  user_data = "${file("config/webuserdata.sh")}"
  ssh_keys = [
    "${var.ssh_fingerprint}"
  ]
  connection {
    user = "root"
    type = "ssh"
    private_key = "${file(var.pvt_key)}"
    timeout = "2m"
  }
}
