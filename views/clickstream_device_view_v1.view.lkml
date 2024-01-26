view: clickstream_device_view_v1 {
  sql_table_name: bible.clickstream_device_view_v1 ;;

  dimension: advertising_id {
    type: string
    sql: ${TABLE}.advertising_id ;;
  }
  dimension: carrier {
    type: string
    sql: ${TABLE}.carrier ;;
  }
  dimension: device_id {
    type: string
    sql: ${TABLE}.device_id ;;
  }
  dimension_group: event {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.event_date ;;
  }
  dimension: host_name {
    type: string
    sql: ${TABLE}.host_name ;;
  }
  dimension: manufacturer {
    type: string
    sql: ${TABLE}.manufacturer ;;
  }
  dimension: mobile_brand_name {
    type: string
    sql: ${TABLE}.mobile_brand_name ;;
  }
  dimension: mobile_model_name {
    type: string
    sql: ${TABLE}.mobile_model_name ;;
  }
  dimension: network_type {
    type: string
    sql: ${TABLE}.network_type ;;
  }
  dimension: operating_system {
    type: string
    sql: ${TABLE}.operating_system ;;
  }
  dimension: operating_system_version {
    type: string
    sql: ${TABLE}.operating_system_version ;;
  }
  dimension: screen_height {
    type: number
    sql: ${TABLE}.screen_height ;;
  }
  dimension: screen_width {
    type: number
    sql: ${TABLE}.screen_width ;;
  }
  dimension: system_language {
    type: string
    sql: ${TABLE}.system_language ;;
  }
  dimension: time_zone_offset_seconds {
    type: number
    sql: ${TABLE}.time_zone_offset_seconds ;;
  }
  dimension: ua_browser {
    type: string
    sql: ${TABLE}.ua_browser ;;
  }
  dimension: ua_browser_version {
    type: string
    sql: ${TABLE}.ua_browser_version ;;
  }
  dimension: ua_device {
    type: string
    sql: ${TABLE}.ua_device ;;
  }
  dimension: ua_device_category {
    type: string
    sql: ${TABLE}.ua_device_category ;;
  }
  dimension: ua_os {
    type: string
    sql: ${TABLE}.ua_os ;;
  }
  dimension: ua_os_version {
    type: string
    sql: ${TABLE}.ua_os_version ;;
  }
  dimension: usage_num {
    type: number
    sql: ${TABLE}.usage_num ;;
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
    drill_fields: [host_name, mobile_model_name, mobile_brand_name, user.user_id]
  }
}
