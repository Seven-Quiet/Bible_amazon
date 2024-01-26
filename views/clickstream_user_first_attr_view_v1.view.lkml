view: clickstream_user_first_attr_view_v1 {
  sql_table_name: bible.clickstream_user_first_attr_view_v1 ;;

  dimension: first_platform {
    type: string
    sql: ${TABLE}.first_platform ;;
  }
  dimension: first_visit_city {
    type: string
    sql: ${TABLE}.first_visit_city ;;
  }
  dimension: first_visit_country {
    type: string
    sql: ${TABLE}.first_visit_country ;;
  }
  dimension: first_visit_device_language {
    type: string
    sql: ${TABLE}.first_visit_device_language ;;
  }
  dimension: first_visit_install_source {
    type: string
    sql: ${TABLE}.first_visit_install_source ;;
  }
  dimension: user_pseudo_id {
    type: string
    sql: ${TABLE}.user_pseudo_id ;;
  }
  measure: count {
    type: count
  }
}
