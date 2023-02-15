view: impact_ca {
  sql_table_name: `alidbtogcp.google_sheet_ca.Impact_CA`
    ;;

  dimension: aov {
    type: number
    sql: ${TABLE}.aov ;;
  }

  dimension: commission {
    type: number
    sql: ${TABLE}.commission ;;
  }

  dimension: conversions {
    type: number
    sql: ${TABLE}.conversions ;;
  }

  dimension: cos {
    type: number
    sql: ${TABLE}.cos ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension_group: date {
    type: time
    description: "%E4Y/%m/%d"
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

  dimension: network_fee {
    type: number
    sql: ${TABLE}.network_fee ;;
  }

  dimension: real_revenue {
    type: number
    sql: ${TABLE}.real_revenue ;;
  }

  dimension: revenue {
    type: number
    sql: ${TABLE}.revenue ;;
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
