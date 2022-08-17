view: ca_google_ads_cost {
  sql_table_name: `alidbtogcp.google_sheet_ca.CA_Google_Ads_Cost`
    ;;

  dimension_group: date {
    type: time
    description: "%E4Y-%m-%d"
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: pmax {
    type: number
    sql: ${TABLE}.pmax ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
