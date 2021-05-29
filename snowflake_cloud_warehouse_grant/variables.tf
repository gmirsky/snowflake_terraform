variable "warehouse_grant" {
  type        = map(any)
  description = "Warehouse grants map used by the for_each loop in snowflake_warehouse_grant"
  default     = {}
  sensitive   = false
}
