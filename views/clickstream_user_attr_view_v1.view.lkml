view: clickstream_user_attr_view_v1 {
  sql_table_name: bible.clickstream_user_attr_view_v1 ;;

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
  dimension: custom_attr_key {
    type: string
    sql: ${TABLE}.custom_attr_key ;;
  }
  dimension: custom_attr_value {
    type: string
    sql: ${TABLE}.custom_attr_value ;;
  }
  dimension: device_id_list {
    type: string
    sql: ${TABLE}.device_id_list ;;
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
  dimension: user_pseudo_id {
    type: string
    sql: ${TABLE}.user_pseudo_id ;;
  }
  measure: count {
    type: count
    drill_fields: [user.user_id]
  }
}
