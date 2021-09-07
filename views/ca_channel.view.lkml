view: ca_channel {
  derived_table: {
    sql: select weekday as Weekday,
      date as Date,
      null as Impression,
      clicks as Clicks,
      null as BounceRate,
      conversions as Conversions,
      revenueuds as RevenueUSD,
      costusd as CostUSD,
      "ShareASale Affiliate" as Channel
      from `alidbtogcp.google_sheet_ca.ca_shareasale_affiliate`

      union all
      select weekday as Weekday,
      date as Date,
      impression as Impression,
      clicks as Clicks,
      bounce_rate as BounceRate,
      conversions as Conversions,
      revenueusd as RevenueUSD,
      costusd as CostUSD,
      "Bing/CPC" as Channel
      from `alidbtogcp.google_sheet_ca.ca_bing_cpc`
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