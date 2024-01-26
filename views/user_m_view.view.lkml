view: user_m_view {
  sql_table_name: bible.user_m_view ;;

  dimension: _channel {
    type: string
    sql: ${TABLE}._channel ;;
  }
  dimension: _first_referer {
    type: string
    sql: ${TABLE}._first_referer ;;
  }
  dimension: _first_traffic_medium {
    type: string
    sql: ${TABLE}._first_traffic_medium ;;
  }
  dimension: _first_traffic_source {
    type: string
    sql: ${TABLE}._first_traffic_source ;;
  }
  dimension: _first_traffic_source_type {
    type: string
    sql: ${TABLE}._first_traffic_source_type ;;
  }
  dimension_group: _first_visit {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._first_visit_date ;;
  }
  dimension: device_id_list {
    type: string
    sql: ${TABLE}.device_id_list ;;
  }
  dimension: event_timestamp {
    type: number
    sql: ${TABLE}.event_timestamp ;;
  }
  dimension: user_first_touch_timestamp {
    type: number
    sql: ${TABLE}.user_first_touch_timestamp ;;
  }
  dimension: user_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }
  dimension: user_ltv {
    type: string
    sql: ${TABLE}.user_ltv ;;
  }
  dimension: user_properties {
    type: string
    sql: ${TABLE}.user_properties ;;
  }
  dimension: user_pseudo_id {
    type: string
    sql: ${TABLE}.user_pseudo_id ;;
  }
  measure: count {
    type: count
    drill_fields: [user.user_id]
  }
}
