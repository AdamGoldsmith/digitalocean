variable "do_api_token" {}
variable "do_ssh_keys" {}

provider "digitalocean" {
  token = "${var.do_api_token}"
}

# Create tag
resource "digitalocean_tag" "demo" {
  name = "Terraform_Demo"
}


# Create Droplet
resource "digitalocean_droplet" "myterraformvm" {
  image    = "centos-7-x64"
  name     = "myvm-1"
  region   = "lon1"
  size     = "s-1vcpu-1gb"
  ssh_keys = ["${var.do_ssh_keys}"]
  tags     = ["${digitalocean_tag.demo.id}"]
}

# Create load_balancer
resource "digitalocean_loadbalancer" "public" {
  name   = "lb-pf"
  region = "lon1"

  forwarding_rule {
    entry_port     = 80
    entry_protocol = "tcp"

    target_port     = 22
    target_protocol = "tcp"
  }

  forwarding_rule {
    entry_port     = 443
    entry_protocol = "tcp"

    target_port     = 8080
    target_protocol = "tcp"
  }

  healthcheck {
    port     = 22
    protocol = "tcp"
  }

  droplet_ids = ["${digitalocean_droplet.myterraformvm.id}"]
}

