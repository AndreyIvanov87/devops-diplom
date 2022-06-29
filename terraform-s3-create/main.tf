provider "yandex" {
  token     = var.yandex_token
  cloud_id  = var.yandex_cloud_id
  folder_id = var.yandex_folder_id
  zone      = var.yandex_zone_default
}

resource "yandex_storage_bucket" "s3-diplom-v1" {
  access_key = "${var.yandex_s3_access_key}"
  secret_key = "${var.yandex_s3_secret_key}"
  bucket = "s3-diplom-v1-bucket-for-terraform"
}

