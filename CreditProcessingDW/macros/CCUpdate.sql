{% macro update_column_value() %}
  {% set update_query %}

    UPDATE analytics.ccard_primary
    SET transactionamount = 1500.00
    WHERE TranID >= 0

  {% endset %}
  
  {% do run_query(update_query) %}
  {{ log("Column updated successfully", info=True) }}
{% endmacro %}