variable "role_grants" {
  type        = map(any)
  description = "Role grants map used by the for_each loop in snowflake_grants"
  default     = {}
  sensitive   = false
}