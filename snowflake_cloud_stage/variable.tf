variable "stage_s3_url" {
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
