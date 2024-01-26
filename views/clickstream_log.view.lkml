view: clickstream_log {
  sql_table_name: bible.clickstream_log ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }
  dimension_group: log {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.log_date ;;
  }
  dimension: log_level {
    type: string
    sql: ${TABLE}.log_level ;;
  }
  dimension: log_msg {
    type: string
    sql: ${TABLE}.log_msg ;;
  }
  dimension: log_name {
    type: string
    sql: ${TABLE}.log_name ;;
  }
  measure: count {
    type: count
    drill_fields: [id, log_name]
  }
}
