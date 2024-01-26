view: clickstream_lifecycle_weekly_view_v1 {
  sql_table_name: bible.clickstream_lifecycle_weekly_view_v1 ;;

  dimension: sum {
    type: number
    sql: ${TABLE}.sum ;;
  }
  dimension: this_week_value {
    type: string
    sql: ${TABLE}.this_week_value ;;
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
