output "vm-names" {
  value = openstack_compute_instance_v2.vps[*].name
}

output "vm-ids" {
  value = openstack_compute_instance_v2.vps[*].id
}

output "vm-ips" {
  value = openstack_compute_instance_v2.vps[*].network[0].fixed_ip_v4
}

output "ansible_inventory" {
  value = [
    for vm in openstack_compute_instance_v2.vps : {
      name = vm.name
      ip   = vm.network[0].fixed_ip_v4
      user = "root"
    }
  ]
}
