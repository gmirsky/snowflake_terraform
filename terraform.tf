terraform {
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.25.4"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "3.43.0"
    }
  }
}
