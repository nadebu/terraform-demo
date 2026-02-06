resource "snowflake_database" "databases" {
  for_each = local.databases

  name         = each.key
  is_transient = false
  comment      = each.value.comment
}