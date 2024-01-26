view: clickstream_user_dim_view_v1 {
  sql_table_name: bible.clickstream_user_dim_view_v1 ;;

  dimension: device_id {
    type: string
    sql: ${TABLE}.device_id ;;
  }
  dimension: first_platform {
    type: string
    sql: ${TABLE}.first_platform ;;
  }
  dimension: first_referer {
    type: string
    sql: ${TABLE}.first_referer ;;
  }
  dimension: first_traffic_source_medium {
    type: string
    sql: ${TABLE}.first_traffic_source_medium ;;
  }
  dimension: first_traffic_source_name {
    type: string
    sql: ${TABLE}.first_traffic_source_name ;;
  }
  dimension: first_traffic_source_source {
    type: string
    sql: ${TABLE}.first_traffic_source_source ;;
  }
  dimension: first_visit_city {
    type: string
    sql: ${TABLE}.first_visit_city ;;
  }
  dimension: first_visit_country {
    type: string
    sql: ${TABLE}.first_visit_country ;;
  }
  dimension_group: first_visit {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.first_visit_date ;;
  }
  dimension: first_visit_device_language {
    type: string
    sql: ${TABLE}.first_visit_device_language ;;
  }
  dimension: first_visit_install_source {
    type: string
    sql: ${TABLE}.first_visit_install_source ;;
  }
  dimension: registration_status {
    type: string
    sql: ${TABLE}.registration_status ;;
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
    drill_fields: [first_traffic_source_name, user.user_id]
  }
}
