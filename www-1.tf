resource "digitalocean_droplet" "www-controller" {
    image = "ubuntu-18-04-x64"
    name = "www-controller"
    region = "nyc3"
    size="s-2vcpu-2gb"
    count = 1
    private_networking = true
    ssh_keys = [
        "${var.ssh_fingerprint}"
    ]

}


resource "digitalocean_droplet" "www-worker" {
    image = "ubuntu-18-04-x64"
    name = "www-worker-${count.index}"
    region = "nyc3"
    size="s-2vcpu-2gb"
    count = 1
    private_networking = true
    ssh_keys = [
        "${var.ssh_fingerprint}"
    ]

}

