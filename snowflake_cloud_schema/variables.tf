variable "schema" {
  type        = map(any)
  description = "Schema map used by the for_each loop in snowflake_schema"
  default     = {}
  sensitive   = false
}