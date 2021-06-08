variable "view" {
  type        = map(any)
  description = "View map used by the for_each loop in snowflake_view"
  default     = {}
  sensitive   = false
}