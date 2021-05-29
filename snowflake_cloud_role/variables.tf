variable "role" {
  type        = map(any)
  description = "Roles map used by the for_each loop in snowflake_roles"
  default     = {}
}