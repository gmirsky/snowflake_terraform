variable "schema_grant" {
  type        = map(any)
  description = "Schema grants map used by the for_each loop in snowflake_schema_grants"
  default     = {}
  sensitive   = false
}
