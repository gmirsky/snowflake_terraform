variable "stage_grant" {
  type        = map(any)
  description = "Stage grant map used by the for_each loop in snowflake_stage_grant"
  default     = {}
  sensitive   = false
}