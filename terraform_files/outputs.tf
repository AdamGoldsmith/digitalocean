output "ip_address" {
  value = "${digitalocean_loadbalancer.public.ip}"
}
