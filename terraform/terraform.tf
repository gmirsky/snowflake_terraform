terraform {
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.25.8"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "3.46.0"
    }
  }
}