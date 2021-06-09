variable "stage_s3_urls" {
  type        = map(any)
  description = "S3 full bucket and folders map used by the for_each loop in snowflake_stage"
  sensitive   = false
}

variable "stage_credentials" {
  type        = string
  description = "Credentials of the AWS user that Snowflake should use"
  sensitive   = true
}

variable "stage_database" {
  type        = string
  description = "Snowflake stage database"
  sensitive   = false
}

variable "stage_schema" {
  type = string
  description = "Snowflake stage schema"
  sensitive = false
}