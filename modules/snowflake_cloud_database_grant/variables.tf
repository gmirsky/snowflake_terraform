variable "database_grant" {
  type        = map(any)
  description = "Database grant map used by the for_each loop in snowflake_cloud_database_grant module"
  default     = {}
  sensitive   = false
}
