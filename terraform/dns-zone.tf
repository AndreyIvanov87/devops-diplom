resource "yandex_dns_zone" "netology" {
  name        = "netology-zone-name"
  #description = "Test public zone"

  #labels = {
  #  label1 = "test-public"
  #}

  zone    = "gate.netology.tech."
  public  = true
  depends_on = [ yandex_compute_instance.gate ]

}

resource "yandex_dns_recordset" "gate" {
  zone_id = yandex_dns_zone.netology.id
  name    = "gate.netology.tech."
  type    = "A"
  ttl     = 200
  data    = ["${yandex_compute_instance.gate.network_interface.0.nat_ip_address}"]

  depends_on = [ yandex_compute_instance.gate , yandex_dns_zone.netology]

}
