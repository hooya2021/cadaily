view: ca_channel {
  derived_table: {
    sql: select weekday as Weekday,
      cast(date as timestamp) as Date,
      null as Impression,
      clicks as Clicks,
      null as BounceRate,
      conversions as Conversions,
      revenueuds as RevenueUSD,
      costusd as CostUSD,
      null as real_revenue,
      "ShareASale Affiliate" as Channel
      from `alidbtogcp.google_sheet_ca.ca_shareasale_affiliate`

      union all
      select weekday as Weekday,
      cast(date as timestamp) as Date,
      impression as Impression,
      clicks as Clicks,
      bounce_rate as BounceRate,
      conversions as Conversions,
      revenueusd as RevenueUSD,
      costusd as CostUSD,
      null as real_revenue,
      "Bing/CPC" as Channel
      from `alidbtogcp.google_sheet_ca.ca_bing_cpc`

      union all
      select weekday as Weekday,
      cast(date as timestamp) as Date,
      null as Impression,
      null as Clicks,
      null as BounceRate,
      conversions as Conversions,
      revenue as RevenueUSD,
      cost as CostUSD,
      real_revenue as real_revenue,
      "Impact" as Channel
      from `alidbtogcp.google_sheet_ca.Impact_CA`
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: weekday {
    type: string
    sql: ${TABLE}.Weekday ;;
  }

  dimension: date {
    type: date
    datatype: date
    sql: ${TABLE}.Date ;;
  }

  dimension_group: created_at {
    type: time
    timeframes: [raw,date,week,month,year,day_of_week,day_of_month,day_of_year]
    sql: ${TABLE}.date ;;
  }

  dimension: impression {
    type: number
    sql: ${TABLE}.Impression ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.Clicks ;;
  }

  dimension: bounce_rate {
    type: number
    sql: ${TABLE}.BounceRate ;;
  }

  dimension: conversions {
    type: number
    sql: ${TABLE}.Conversions ;;
  }

  dimension: revenue_usd {
    type: number
    sql: ${TABLE}.RevenueUSD ;;
  }

  dimension: real_revenue {
    type: number
    sql: ${TABLE}.real_revenue ;;
  }

  dimension: cost_usd {
    type: number
    sql: ${TABLE}.CostUSD ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.Channel ;;
  }

  set: detail {
    fields: [
      weekday,
      date,
      impression,
      clicks,
      bounce_rate,
      conversions,
      revenue_usd,
      cost_usd,
      channel
    ]
  }
}
