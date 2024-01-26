view: item_m_view {
  sql_table_name: bible.item_m_view ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }
  dimension: event_timestamp {
    type: number
    sql: ${TABLE}.event_timestamp ;;
  }
  dimension: properties {
    type: string
    sql: ${TABLE}.properties ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
