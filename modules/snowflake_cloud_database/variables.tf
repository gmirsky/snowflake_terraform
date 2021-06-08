variable "database" {
  type        = map(any)
  description = "Database map used by the for_each loop in snowflake_database"
  default     = {}
  sensitive   = false
}

variable "snowflake_region" {
  type        = string
  description = "Snowflake acccount region"
  sensitive   = false
}