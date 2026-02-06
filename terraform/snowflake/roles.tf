# # Create new roles using USERADMIN
resource "snowflake_account_role" "custom_roles" {
  for_each = local.snowflake_roles
  
  provider = snowflake.useradmin
  name    = each.key
  comment = each.value.comment
}