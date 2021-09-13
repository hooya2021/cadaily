connection: "ca_daily"
# include all the views
include: "/views/**/*.view"

datagroup: ca_daily_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: ca_daily_default_datagroup

explore: ca_facebooke_ads {}
explore: ca_channel {}