view: clickstream_session_view_v1 {
  sql_table_name: bible.clickstream_session_view_v1 ;;

  dimension: bounced_session {
    type: number
    sql: ${TABLE}.bounced_session ;;
  }
  dimension: engaged_session {
    type: number
    sql: ${TABLE}.engaged_session ;;
  }
  dimension: entry_view {
    type: string
    sql: ${TABLE}.entry_view ;;
  }
  dimension: exit_view {
    type: string
    sql: ${TABLE}.exit_view ;;
  }
  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
  }
  dimension_group: session {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.session_date ;;
  }
  dimension_group: session_date_hour {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.session_date_hour ;;
  }
  dimension: session_duration {
    type: number
    sql: ${TABLE}.session_duration ;;
  }
  dimension: session_engagement_time {
    type: number
    sql: ${TABLE}.session_engagement_time ;;
  }
  dimension: session_id {
    type: string
    sql: ${TABLE}.session_id ;;
  }
  dimension: session_start_timestamp {
    type: number
    sql: ${TABLE}.session_start_timestamp ;;
  }
  dimension: session_views {
    type: number
    sql: ${TABLE}.session_views ;;
  }
  dimension: user_pseudo_id {
    type: string
    sql: ${TABLE}.user_pseudo_id ;;
  }
  measure: count {
    type: count
  }
}
