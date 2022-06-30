#resource "null_resource" "wait" {
#  provisioner "local-exec" {
#    command = "sleep 100"
#  }
#
#  depends_on = [
#    local_file.inventory
#  ]
#}

resource "null_resource" "connect" {
  provisioner "local-exec" {
    command = "ANSIBLE_FORCE_COLOR=1 ansible-playbook -i ../ansible/inventory ../ansible/connect.yml"
  }

  depends_on = [
#    null_resource.wait
    local_file.inventory
  ]
}

