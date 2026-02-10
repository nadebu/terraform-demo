resource "snowflake_user" "dlt" {
  provider = snowflake.useradmin
  name       = "SVC_DLT"
  login_name = "SVC_DLT"
  display_name = "Service user for dlt"

  rsa_public_key = file("${path.module}/keys/svc_dlt_key.pub")

  default_role = "LOADER"
  default_warehouse = "LOADER_WH"
}

