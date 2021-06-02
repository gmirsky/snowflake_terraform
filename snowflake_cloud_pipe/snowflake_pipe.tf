resource "snowflake_pipe" "pipe" {
  for_each       = var.pipe
  database       = element(split(".", each.key), 0)
  schema         = element(split(".", each.key), 1)
  name           = replace(each.value.stage_name, ".", "_")
  comment        = "${replace(each.value.stage_name, ".", "_")} pipe for table ${each.key}"
  copy_statement = <<ENDOFSTATEMENT
  copy into "${element(split(".", each.key), 0)}"."${element(split(".", each.key), 1)}"."${element(split(".", each.key), 2)}"
   from @"${element(split(".", each.key), 0)}"."${element(split(".", each.key), 1)}"."${each.value.stage_name}"
   FILE_FORMAT = ( TYPE =  "${each.value.file_format_type}" )
  ENDOFSTATEMENT
  auto_ingest    = each.value.auto_ingest
}
