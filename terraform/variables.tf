# Заменить на ID своего облака
# https://console.cloud.yandex.ru/cloud?section=overview
variable "yandex_cloud_id" {
  default = "b1ghsk460b4nn8sps0p2"
}

# Заменить на Folder своего облака
# https://console.cloud.yandex.ru/cloud?section=overview
variable "yandex_folder_id" {
  default = "b1gq9soqejoerr49t4a4"
}


# Зона размещения инфраструктуры по-умолчанию
variable "yandex_zone_default" {
  default = "ru-central1-a"
}


#access credentials
variable "yandex_token" { 
	type = string 
        sensitive = true
	}
variable "yandex_s3_access_key" { 
	type = string 
	sensitive = true
	}
variable "yandex_s3_secret_key" { 
	type = string 
        sensitive = true
	}

# Заменить на ID своего образа
# ID можно узнать с помощью команды yc compute image list
# yc compute image list --folder-id standard-images
# ubuntu-20-04-lts-v20220509
variable "ubuntu" {
  default = "fd82re2tpfl4chaupeuf"
}

#ID образа gitlab ce от яндекса
variable "ubuntu_gitlab_ce" {
default = "fd8gmpfrnphth71tmuh0"
}

# задаем число нод в каждом воркспейсе
locals {
  db_instance_count = {
    stage = 2
    #prod  = 2
  }
}

