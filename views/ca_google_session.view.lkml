view: ca_google_session {
  sql_table_name: `alidbtogcp.google_sheet_ca.ca_google_session`
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

  dimension: new_users {
    type: number
    sql: ${TABLE}.new_users ;;
  }

  dimension: returning_users {
    type: number
    sql: ${TABLE}.returning_users ;;
  }

  dimension: session {
    type: number
    sql: ${TABLE}.session ;;
  }

  dimension: users {
    type: number
    sql: ${TABLE}.users ;;
  }

  dimension: weekday {
    type: string
    sql: ${TABLE}.weekday ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
