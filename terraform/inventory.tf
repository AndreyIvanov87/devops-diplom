resource "local_file" "inventory" {
  content = <<-DOC
    # Ansible inventory containing variable values from Terraform.
    # Generated by Terraform.

    [nodes:children]
    front
    db
    back

    [front]
    gate.netology.tech ansible_host=${yandex_compute_instance.gate.network_interface.0.nat_ip_address}

    [db]
    db01.netology.tech ansible_host=${yandex_compute_instance.dbvm[0].network_interface.0.ip_address}
    db02.netology.tech ansible_host=${yandex_compute_instance.dbvm[1].network_interface.0.ip_address}

    [db:vars]
    ansible_ssh_common_args='-o ProxyCommand="ssh -W %h:%p -q ${yandex_compute_instance.gate.network_interface.0.nat_ip_address}"'


    [back]
    app.netology.tech ansible_host=${yandex_compute_instance.appvm.network_interface.0.ip_address}
    gitlab.netology.tech ansible_host=${yandex_compute_instance.gitlabvm.network_interface.0.ip_address}
    runner.netology.tech ansible_host=${yandex_compute_instance.runnervm.network_interface.0.ip_address}
    monitoring.netology.tech ansible_host=${yandex_compute_instance.monitoringvm.network_interface.0.ip_address}

    [back:vars]
    ansible_ssh_common_args='-o ProxyCommand="ssh -W %h:%p -q ${yandex_compute_instance.gate.network_interface.0.nat_ip_address}"'


    DOC
  filename = "../ansible/inventory"

  depends_on = [
    yandex_compute_instance.gate,
    yandex_compute_instance.dbvm,
    yandex_compute_instance.appvm,
    yandex_compute_instance.gitlabvm,
    yandex_compute_instance.runnervm,
    yandex_compute_instance.monitoringvm
  ]

}

