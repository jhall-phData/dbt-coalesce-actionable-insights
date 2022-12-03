{% macro create_udfs() %}

{{ create_f_future_date() }};

{{ log("Function f_future_date Created!", info=True) }}

{% endmacro %}