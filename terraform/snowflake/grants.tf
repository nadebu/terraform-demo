# Grant the new role to SYSADMIN (best practice)
resource "snowflake_grant_account_role" "grant_loader_role_to_sysadmin" {
    provider         = snowflake.useradmin
    role_name        = snowflake_account_role.loader_role.name
    parent_role_name = "SYSADMIN"
}