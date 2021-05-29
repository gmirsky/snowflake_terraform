variable "table" {
  type        = map(any)
  description = "Table map used by the for_each loop in snowflake_table"
  default     = {}
}
