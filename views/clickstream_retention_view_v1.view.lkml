view: clickstream_retention_view_v1 {
  sql_table_name: bible.clickstream_retention_view_v1 ;;

  dimension: day_diff {
    type: number
    sql: ${TABLE}.day_diff ;;
  }
  dimension_group: first {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.first_date ;;
  }
  dimension: returned_user_count {
    type: number
    sql: ${TABLE}.returned_user_count ;;
  }
  dimension: total_users {
    type: number
    sql: ${TABLE}.total_users ;;
  }
  measure: count {
    type: count
  }
}
