resource "yandex_vpc_network" "dipnet" {
  name = "dipnet-name"
}

resource "yandex_vpc_subnet" "private-subnet" {
  name = "private-subnet-name"
  zone           = "ru-central1-a"
  network_id     = "${yandex_vpc_network.dipnet.id}"
  v4_cidr_blocks = ["192.168.2.0/24"]
  route_table_id = "${yandex_vpc_route_table.nat.id}"
  depends_on = [
    yandex_vpc_route_table.nat,
    yandex_vpc_network.dipnet
  ]

}

resource "yandex_vpc_route_table" "nat" {
  network_id = "${yandex_vpc_network.dipnet.id}"

  static_route {
    destination_prefix = "0.0.0.0/0"
    #next_hop_address   = "${yandex_compute_instance.gate.network_interface.0.ip_address}"
    next_hop_address = "192.168.2.200"
}
  depends_on = [
#    yandex_compute_instance.gate,
    yandex_vpc_network.dipnet
  ]

}
