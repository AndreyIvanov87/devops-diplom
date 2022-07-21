provider "yandex" {
  token     = var.yandex_token
  cloud_id  = var.yandex_cloud_id
  folder_id = var.yandex_folder_id
  zone      = var.yandex_zone_default
}


resource "yandex_compute_instance" "gate" {
  name = "gate"
  platform_id = "standard-v1"
  #hostname    = "gate.netology.tech"
  
  resources {
    cores  = 2
    memory = 2
    core_fraction = 20
}

#образ диска от nat instance https://cloud.yandex.ru/marketplace/products/yc/nat-instance-ubuntu-18-04-lts
  boot_disk {
    initialize_params {
      image_id = "fd84mnpg35f7s7b0f5lg"
      size = 10
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.private-subnet.id
    nat       = true
    ip_address = "192.168.2.200"

  }

  metadata = {
    ssh-keys  = "vagrant:${file("~/.ssh/id_rsa.pub")}"
    user-data = "${file("./user-meta.txt")}"
  }
  
}

resource "yandex_compute_instance" "dbvm" {
  platform_id = "standard-v1"
#  hostname    = "db0${count.index+1}.netology.tech"
  count       = local.db_instance_count[terraform.workspace]
  name        = "db0${count.index+1}"
  resources {
    cores  = 2
    memory = 2
    core_fraction = 20
  }

  boot_disk {
    initialize_params {
      image_id = "${var.ubuntu}"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.private-subnet.id
    ip_address = "192.168.2.20${count.index+1}"
}

  metadata = {
    user-data = "${file("./user-meta.txt")}"
  }
}

resource "yandex_compute_instance" "appvm" {
  platform_id = "standard-v1"
#  hostname    = "app.netology.tech"
  name        = "app"
  resources {
    cores  = 4
    memory = 4
    core_fraction = 20
  }

  boot_disk {
    initialize_params {
      image_id = "${var.ubuntu}"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.private-subnet.id
    ip_address = "192.168.2.203"
}

  metadata = {
    #ssh-keys  = "vagrant:${file("~/.ssh/id_rsa.pub")}"
    user-data = "${file("./user-meta.txt")}"
  }
}

resource "yandex_compute_instance" "gitlabvm" {
  platform_id = "standard-v1"
#  hostname    = "gitlab.netology.tech"
  name        = "gitlab"
  resources {
    cores  = 4
    memory = 4
    core_fraction = 100
  }

  boot_disk {
    initialize_params {
      image_id = "${var.ubuntu_gitlab_ce}"
      size = 20
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.private-subnet.id
    ip_address = "192.168.2.204"
}

  metadata = {
    user-data = "${file("./user-meta.txt")}"
  }
}


resource "yandex_compute_instance" "runnervm" {
  platform_id = "standard-v1"
#  hostname    = "runner.netology.tech"
  name        = "runner"
  resources {
    cores  = 4
    memory = 4
    core_fraction = 100
  }

  boot_disk {
    initialize_params {
      image_id = "${var.ubuntu}"
      size = 20
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.private-subnet.id
    ip_address = "192.168.2.205"
}

  metadata = {
    user-data = "${file("./user-meta.txt")}"
  }
}


resource "yandex_compute_instance" "monitoringvm" {
  platform_id = "standard-v1"
  name                      = "monitoring"
  #zone                      = "ru-central1-a"
  #hostname                  = "monitoring.netology.tech"
  allow_stopping_for_update = true

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.ubuntu}"
      size        = "50"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.private-subnet.id
    ip_address = "192.168.2.206"
  }

  metadata = {
    user-data = "${file("./user-meta.txt")}"
  }

}

