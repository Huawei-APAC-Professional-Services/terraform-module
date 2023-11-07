terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.13.0"
    }
    huaweicloud = {
      source  = "huaweicloud/huaweicloud"
      version = "1.51.0"
    }
  }
}

provider "aws" {}

provider "huaweicloud" {}