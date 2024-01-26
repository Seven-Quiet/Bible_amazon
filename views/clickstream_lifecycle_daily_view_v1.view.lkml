view: clickstream_lifecycle_daily_view_v1 {
  sql_table_name: bible.clickstream_lifecycle_daily_view_v1 ;;

  dimension: sum {
    type: number
    sql: ${TABLE}.sum ;;
  }
  dimension: this_day_value {
    type: string
    sql: ${TABLE}.this_day_value ;;
  }
  dimension_group: time_period {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.time_period ;;
  }
  measure: count {
    type: count
  }
}
