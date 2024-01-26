view: event_parameter {
  sql_table_name: bible.event_parameter ;;

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
  dimension: event_timestamp {
    type: number
    sql: ${TABLE}.event_timestamp ;;
  }
  measure: count {
    type: count
    drill_fields: [event_name, event.event_name, event.event_id]
  }
}
