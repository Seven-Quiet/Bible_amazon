connection: "bible_amazon"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: bible_amazon_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: bible_amazon_default_datagroup

explore: clickstream_device_view_v1 {
  join: user {
    type: left_outer 
    sql_on: ${clickstream_device_view_v1.user_id} = ${user.user_id} ;;
    relationship: many_to_one
  }
}

explore: clickstream_event_parameter_view_v1 {
  join: user {
    type: left_outer 
    sql_on: ${clickstream_event_parameter_view_v1.user_id} = ${user.user_id} ;;
    relationship: many_to_one
  }

  join: event {
    type: left_outer 
    sql_on: ${clickstream_event_parameter_view_v1.event_id} = ${event.event_id} ;;
    relationship: many_to_one
  }
}

explore: clickstream_event_view_v1 {
  join: user {
    type: left_outer 
    sql_on: ${clickstream_event_view_v1.user_id} = ${user.user_id} ;;
    relationship: many_to_one
  }

  join: event {
    type: left_outer 
    sql_on: ${clickstream_event_view_v1.event_id} = ${event.event_id} ;;
    relationship: many_to_one
  }
}

explore: clickstream_lifecycle_daily_view_v1 {}

explore: clickstream_lifecycle_weekly_view_v1 {}

explore: clickstream_log {}

explore: clickstream_retention_view_v1 {}

explore: clickstream_session_view_v1 {}

explore: clickstream_user_attr_view_v1 {
  join: user {
    type: left_outer 
    sql_on: ${clickstream_user_attr_view_v1.user_id} = ${user.user_id} ;;
    relationship: many_to_one
  }
}

explore: clickstream_user_dim_view_v1 {
  join: user {
    type: left_outer 
    sql_on: ${clickstream_user_dim_view_v1.user_id} = ${user.user_id} ;;
    relationship: many_to_one
  }
}

explore: clickstream_user_first_attr_view_v1 {}

explore: event {
  join: user {
    type: left_outer 
    sql_on: ${event.user_id} = ${user.user_id} ;;
    relationship: many_to_one
  }
}

explore: event_parameter {
  join: event {
    type: left_outer 
    sql_on: ${event_parameter.event_id} = ${event.event_id} ;;
    relationship: many_to_one
  }

  join: user {
    type: left_outer 
    sql_on: ${event.user_id} = ${user.user_id} ;;
    relationship: many_to_one
  }
}

explore: item {}

explore: item_m_view {}

explore: user {}

explore: user_m_view {
  join: user {
    type: left_outer 
    sql_on: ${user_m_view.user_id} = ${user.user_id} ;;
    relationship: many_to_one
  }
}

