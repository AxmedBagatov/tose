resource "openstack_compute_keypair_v2" "mykey" {
  name       = "mykey"
  public_key = file("/root/.ssh/id_rsa.pub")
}


resource "openstack_compute_instance_v2" "vps" {
  count       = var.vms_count
  name        = "vps-kuber-${count.index + 1}"
  image_name  = var.image_name
  flavor_name = var.flavor_name
  key_pair    = openstack_compute_keypair_v2.mykey.name
  network {
    name = var.network_name
  }
  security_groups = ["allow_all"]
}
