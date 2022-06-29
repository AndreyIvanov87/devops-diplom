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


#Зона размещения инфраструктуры по-умолчанию
variable "yandex_zone_default" {
  default = "ru-central1-a"
}


#access credentials
variable "yandex_token" { type = string }
variable "yandex_s3_access_key" { 
	type = string 
	sensitive = true
	}
variable "yandex_s3_secret_key" { 
	type = string 
        sensitive = true
	}

