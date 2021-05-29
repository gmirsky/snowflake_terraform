variable "warehouse" {
  type        = map(any)
  description = "Warehouse map used by the for_each loop in snowflake_warehouse"
  default     = {}
  sensitive   = false
}