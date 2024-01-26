view: clickstream_event_view_v1 {
  sql_table_name: bible.clickstream_event_view_v1 ;;

  dimension: app_info_app_id {
    type: string
    sql: ${TABLE}.app_info_app_id ;;
  }
  dimension: app_info_install_source {
    type: string
    sql: ${TABLE}.app_info_install_source ;;
  }
  dimension: app_info_package_id {
    type: string
    sql: ${TABLE}.app_info_package_id ;;
  }
  dimension: app_info_sdk_name {
    type: string
    sql: ${TABLE}.app_info_sdk_name ;;
  }
  dimension: app_info_sdk_version {
    type: string
    sql: ${TABLE}.app_info_sdk_version ;;
  }
  dimension: app_info_version {
    type: string
    sql: ${TABLE}.app_info_version ;;
  }
  dimension: device_carrier {
    type: string
    sql: ${TABLE}.device_carrier ;;
  }
  dimension: device_id {
    type: string
    sql: ${TABLE}.device_id ;;
  }
  dimension: device_manufacturer {
    type: string
    sql: ${TABLE}.device_manufacturer ;;
  }
  dimension: device_mobile_brand_name {
    type: string
    sql: ${TABLE}.device_mobile_brand_name ;;
  }
  dimension: device_mobile_model_name {
    type: string
    sql: ${TABLE}.device_mobile_model_name ;;
  }
  dimension: device_network_type {
    type: string
    sql: ${TABLE}.device_network_type ;;
  }
  dimension: device_operating_system {
    type: string
    sql: ${TABLE}.device_operating_system ;;
  }
  dimension: device_operating_system_version {
    type: string
    sql: ${TABLE}.device_operating_system_version ;;
  }
  dimension: device_screen_height {
    type: number
    sql: ${TABLE}.device_screen_height ;;
  }
  dimension: device_screen_width {
    type: number
    sql: ${TABLE}.device_screen_width ;;
  }
  dimension: device_system_language {
    type: string
    sql: ${TABLE}.device_system_language ;;
  }
  dimension: device_time_zone_offset_seconds {
    type: number
    sql: ${TABLE}.device_time_zone_offset_seconds ;;
  }
  dimension: event_bundle_sequence_id {
    type: number
    sql: ${TABLE}.event_bundle_sequence_id ;;
  }
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
  dimension: event_previous_timestamp {
    type: number
    sql: ${TABLE}.event_previous_timestamp ;;
  }
  dimension: event_timestamp {
    type: number
    sql: ${TABLE}.event_timestamp ;;
  }
  dimension: event_value_in_usd {
    type: number
    sql: ${TABLE}.event_value_in_usd ;;
  }
  dimension: geo_city {
    type: string
    sql: ${TABLE}.geo_city ;;
  }
  dimension: geo_continent {
    type: string
    sql: ${TABLE}.geo_continent ;;
  }
  dimension: geo_country {
    type: string
    sql: ${TABLE}.geo_country ;;
  }
  dimension: geo_locale {
    type: string
    sql: ${TABLE}.geo_locale ;;
  }
  dimension: geo_metro {
    type: string
    sql: ${TABLE}.geo_metro ;;
  }
  dimension: geo_region {
    type: string
    sql: ${TABLE}.geo_region ;;
  }
  dimension: geo_sub_continent {
    type: string
    sql: ${TABLE}.geo_sub_continent ;;
  }
  dimension: host_name {
    type: string
    sql: ${TABLE}.host_name ;;
  }
  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
  }
  dimension: project_id {
    type: string
    sql: ${TABLE}.project_id ;;
  }
  dimension: traffic_source_medium {
    type: string
    sql: ${TABLE}.traffic_source_medium ;;
  }
  dimension: traffic_source_name {
    type: string
    sql: ${TABLE}.traffic_source_name ;;
  }
  dimension: traffic_source_source {
    type: string
    sql: ${TABLE}.traffic_source_source ;;
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
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	traffic_source_name,
	host_name,
	device_mobile_model_name,
	device_mobile_brand_name,
	app_info_sdk_name,
	event_name,
	user.user_id,
	event.event_name,
	event.event_id
	]
  }

}
