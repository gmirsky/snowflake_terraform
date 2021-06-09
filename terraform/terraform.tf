terraform {
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.25.5"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "3.44.0"
    }
  }
}