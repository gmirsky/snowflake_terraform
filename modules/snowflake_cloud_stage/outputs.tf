output "id" {
  value = {
    for k, v in snowflake_stage.stage : k => v.id
  }
}

output "name" {
  value = {
    for k, v in snowflake_stage.stage : k => upper(v.name)
  }
}

# Upper() was applied to the output value as a work around to this error

# Error: Provider produced inconsistent final plan
# │
# │ When expanding the plan for module.snowflake_cloud_stage_grant.snowflake_stage_grant.stage_grant["snowflake_test_data/avro/"] to include new values
# │ learned so far during apply, provider "registry.terraform.io/chanzuckerberg/snowflake" produced an invalid new value for .stage_name: was
# │ cty.StringVal("snowflake_test_data_avro"), but now cty.StringVal("SNOWFLAKE_TEST_DATA_AVRO").
# │
# │ This is a bug in the provider, which should be reported in the provider's own issue tracker.
# ╵


output "url" {
  value = {
    for k, v in snowflake_stage.stage : k => v.url
  }
}

