view: event_drop_duplicate {
  # Or, you could make this view a derived table, like this:
  derived_table: {
    sql:
    SELECT
        event_id,
        event_date,
        event_timestamp,
        event_previous_timestamp,
        event_name,
        event_value_in_usd,
        device,
        geo,
        traffic_source,
        app_info,
        platform,
        project_id,
        items,
        user_pseudo_Id,
        user_id,
        max(event_bundle_sequence_id) as event_bundle_sequence_id,
        max(ingest_timestamp) as ingest_timestamp
    FROM
        "bible_project"."bible"."event"
    group by 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15
      ;;
  }

  dimension: event_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.event_id ;;
  }
  dimension: app_info {
    type: string
    sql: ${TABLE}.app_info ;;
  }
  dimension: device {
    type: string
    sql: ${TABLE}.device ;;
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
  dimension: geo {
    type: string
    sql: ${TABLE}.geo ;;
  }
  dimension: ingest_timestamp {
    type: number
    sql: ${TABLE}.ingest_timestamp ;;
  }
  dimension: items {
    type: string
    sql: ${TABLE}.items ;;
  }
  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
  }
  dimension: project_id {
    type: string
    sql: ${TABLE}.project_id ;;
  }
  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
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
      event_id,
      event_name,
      user.user_id,
      clickstream_event_parameter_view_v1.count,
      clickstream_event_view_v1.count,
      event_parameter.count
    ]
  }
  measure: start_app {
    type: count
    filters: [event_name: "start_app"]
  }

  measure: appopen_ad_show {
    type: count
    filters: [event_name: "appopen_enter_ad_show_total"]
  }
  measure: appopen_ad_launch {
    type: count
    filters: [event_name: "appopen_enter_launch"]
  }
  measure: appopen_show_rate {
    type: number
    sql: case when ${appopen_ad_launch}=0 then 0 else cast(${appopen_ad_show} as float)/cast(${appopen_ad_launch} as float) end;;
    value_format: "0.00%"
  }
  measure: pray_ad_show {
    type: count
    filters: [event_name: "pray_ad_show"]
  }

  measure: pray_ad_prepare {
    type: count
    filters: [event_name: "pray_ad_prepare_show"]
  }

  measure: pray_show_rate {
    type: number
    sql: case when ${pray_ad_prepare}=0 then 0 else cast(${pray_ad_show} as float) / cast(${pray_ad_prepare} as float) end ;;
    value_format: "0.00%"
  }

  measure: quiz_ad_show {
    type: count
    filters: [event_name: "quiz_UK_ad_inter_show"]
  }

  measure: quiz_ad_prepare {
    type: count
    filters: [event_name: "quiz_UK_ad_inter_prepare"]
  }

  measure: quiz_show_rate {
    type: number
    sql: case when ${quiz_ad_prepare}=0 then 0 else cast(${quiz_ad_prepare} as float) / cast(${quiz_ad_prepare} as float) end ;;
    value_format: "0.00%"
  }

  measure: readmark_ad_show {
    type: count
    filters: [event_name: "readmark_ad_show"]
  }

  measure: readmark_ad_prepare {
    type: count
    filters: [event_name: "readmark_ad_prepare_show"]
  }

  measure: readmark_show_rate {
    type: number
    sql: case when ${readmark_ad_prepare}=0 then 0 else cast(${readmark_ad_show} as float) / cast(${readmark_ad_prepare} as float) end ;;
    value_format: "0.00%"
  }


  #uv
  measure: start_app_uv {
    type: count_distinct
    sql: ${user_pseudo_id} ;;
    filters: [event_name: "start_app"]
  }

  measure: appopen_ad_show_uv {
    type: count_distinct
    sql: ${user_pseudo_id} ;;
    filters: [event_name: "appopen_enter_ad_show_total"]
  }

  measure: appopen_ad_launch_uv {
    type: count_distinct
    sql: ${user_pseudo_id} ;;
    filters: [event_name: "appopen_enter_launch"]
  }

  measure: pray_ad_show_uv {
    type: count_distinct
    sql: ${user_pseudo_id} ;;
    filters: [event_name: "pray_ad_show"]
  }

  measure: pray_ad_prepare_uv {
    type: count_distinct
    sql: ${user_pseudo_id} ;;
    filters: [event_name: "pray_ad_prepare_show"]
  }

  measure: quiz_ad_show_uv {
    type: count_distinct
    sql: ${user_pseudo_id} ;;
    filters: [event_name: "quiz_UK_ad_inter_show"]
  }

  measure: quiz_ad_prepare_uv {
    type: count_distinct
    sql: ${user_pseudo_id} ;;
    filters: [event_name: "quiz_UK_ad_inter_prepare"]
  }

  measure: readmark_ad_show_uv {
    type: count_distinct
    sql: ${user_pseudo_id} ;;
    filters: [event_name: "readmark_ad_show"]
  }

  measure: readmark_ad_prepare_uv {
    type: count_distinct
    sql: ${user_pseudo_id} ;;
    filters: [event_name: "readmark_ad_prepare_show"]
  }
}
