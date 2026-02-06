# Grant the new roles to SYSADMIN (best practice)
resource "snowflake_grant_account_role" "grant_roles_to_sysadmin" {
  for_each = snowflake_account_role.custom_roles
  
  provider = snowflake.useradmin
  role_name = each.value.name
  parent_role_name = "SYSADMIN"
}
