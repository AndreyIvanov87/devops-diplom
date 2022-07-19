resource "null_resource" "connect" {
  provisioner "local-exec" {
    command = "ANSIBLE_FORCE_COLOR=1 ansible-playbook -i ../ansible/inventory ../ansible/connect.yml"
  }

  depends_on = [
    local_file.inventory
  ]
}

resource "null_resource" "gate-setup" {
  provisioner "local-exec" {
    command = "ANSIBLE_FORCE_COLOR=1 ansible-playbook -i ../ansible/inventory ../ansible/site.yml"
  }

  depends_on = [
    null_resource.connect
  ]
}


resource "null_resource" "mysql-setup" {
  provisioner "local-exec" {
    command = "ANSIBLE_FORCE_COLOR=1 ansible-playbook -i ../ansible/inventory ../ansible/mysql.yml"
  }

  depends_on = [
    null_resource.gate-setup
  ]
}

resource "null_resource" "gitlab-setup" {
  provisioner "local-exec" {
    command = "ANSIBLE_FORCE_COLOR=1 ansible-playbook -i ../ansible/inventory ../ansible/gitlab.yml"
  }

  depends_on = [
    null_resource.mysql-setup
  ]
}

resource "null_resource" "monitoring-setup" {
  provisioner "local-exec" {
    command = "ANSIBLE_FORCE_COLOR=1 ansible-playbook -i ../ansible/inventory ../ansible/monitoring.yml"
  }

  depends_on = [
    null_resource.connect,
    null_resource.gate-setup,
    null_resource.mysql-setup,
    null_resource.gitlab-setup
  ]
}

resource "null_resource" "gitlab-runner" {
  provisioner "local-exec" {
    command = "ANSIBLE_FORCE_COLOR=1 ansible-playbook -i ../ansible/inventory ../ansible/runner.yml"
  }

  depends_on = [
    null_resource.monitoring-setup
  ]
}





