resource "snowflake_database" "raw" {
  name         = "RAW"
  is_transient = false
}