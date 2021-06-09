variable "stage_s3_urls" {
  type        = map(any)
  description = "S3 full bucket and folders map used by the for_each loop in snowflake_stage"
  default     = {}
  sensitive   = false
}

variable "stage_credentials" {
  type        = string
  description = "Credentials of the AWS user that Snowflake should use"
  default     = ""
  sensitive   = true
}

variable "stage_database" {
  type        = string
  description = "Snowflake stage database"
  default     = ""
  sensitive   = false
}

variable "stage_schema" {
  type        = string
  description = "Snowflake stage schema"
  default     = ""
  sensitive   = false
}

variable "snowflake_region" {
  type        = string
  description = "Snowflake acccount region"
  default     = "us-east-1"
  sensitive   = false
}

variable "snowflake_role" {
  type        = string
  description = "Snowflake role to run as"
  sensitive   = false
}

variable "snowflake_username" {
  type        = string
  description = "Snowflake user name to run as"
  sensitive   = false
}

variable "snowflake_account" {
  type        = string
  description = "Snowflake account to run against"
  sensitive   = false
}

variable "snowflake_password" {
  type        = string
  description = "Snowflake user password"
  sensitive   = true
}
