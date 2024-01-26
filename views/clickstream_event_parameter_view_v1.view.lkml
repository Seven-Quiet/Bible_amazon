view: clickstream_event_parameter_view_v1 {
  sql_table_name: bible.clickstream_event_parameter_view_v1 ;;

  dimension_group: event {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.event_date ;;
  }
  dimension: event_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.event_id ;;
  }
  dimension: event_name {
    type: string
    sql: ${TABLE}.event_name ;;
  }
  dimension: event_param_double_value {
    type: number
    sql: ${TABLE}.event_param_double_value ;;
  }
  dimension: event_param_float_value {
    type: number
    sql: ${TABLE}.event_param_float_value ;;
  }
  dimension: event_param_int_value {
    type: number
    sql: ${TABLE}.event_param_int_value ;;
  }
  dimension: event_param_key {
    type: string
    sql: ${TABLE}.event_param_key ;;
  }
  dimension: event_param_string_value {
    type: string
    sql: ${TABLE}.event_param_string_value ;;
  }
  dimension: event_param_value {
    type: string
    sql: ${TABLE}.event_param_value ;;
  }
  dimension: event_timestamp {
    type: number
    sql: ${TABLE}.event_timestamp ;;
  }
  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
  }
  dimension: user_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }
  dimension: user_pseudo_id {
    type: string
    sql: ${TABLE}.user_pseudo_id ;;
  }
  measure: count {
    type: count
    drill_fields: [event_name, user.user_id, event.event_name, event.event_id]
  }
}
