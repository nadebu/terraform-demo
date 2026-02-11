resource "snowflake_user" "dlt" {
  provider = snowflake.useradmin
  name       = "SVC_DLT"
  login_name = "SVC_DLT"
  display_name = "Service user for dlt"

  rsa_public_key = file("${path.module}/keys/svc_dlt_key.pub")

  default_role = "LOADER"
  default_warehouse = "LOADER_WH"
}

resource "snowflake_user" "dbt" {
  provider = snowflake.useradmin
  name       = "SVC_DBT"
  login_name = "SVC_DBT"
  display_name = "Service user for dbt"

  rsa_public_key = file("${path.module}/keys/svc_dbt_key.pub")

  default_role = "TRANSFORMER"
  default_warehouse = "TRANSFORMER_WH"
}

resource "snowflake_user" "tableau" {
  provider = snowflake.useradmin
  name       = "SVC_TABLEAU"
  login_name = "SVC_TABLEAU"
  display_name = "Service user for tableau"

  rsa_public_key = file("${path.module}/keys/svc_tableau_key.pub")

  default_role = "READER"
  default_warehouse = "READER_WH"
}