terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"

  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "s3-diplom-v1-bucket-for-terraform"
    region     = "ru-central1"
    key        = "current-netology.tfstate"
    #credentials: use environment variables
    # export AWS_ACCESS_KEY_ID="ХХХХХХХХХХХХХХХХХХХ"
    # export AWS_SECRET_ACCESS_KEY="ХХХХХХХХХХХХХХХ"

    skip_region_validation      = true
    skip_credentials_validation = true
  }


}

