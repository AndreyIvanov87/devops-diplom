output "internal_ip_address_gate" {
  value = yandex_compute_instance.gate.network_interface.0.ip_address
}

output "external_ip_address_gate" {
  value = yandex_compute_instance.gate.network_interface.0.nat_ip_address
}

output "private-subnet" {
  value = yandex_vpc_subnet.private-subnet.id
}

output "internal_ip_address_dbvm" {
  value = yandex_compute_instance.dbvm[0].network_interface.0.ip_address
}

output "external_ip_address_dbvm" {
  value = yandex_compute_instance.dbvm[0].network_interface.0.nat_ip_address
}

