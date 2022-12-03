{% macro create_f_future_date() %}
CREATE OR REPLACE FUNCTION {{ generate_database_name('coalesce_demo') }}.{{ generate_schema_name('clean') }}.f_future_date()
RETURNS TIMESTAMP IMMUTABLE 
AS 
$$
'2100-01-01'::TIMESTAMP
$$
{% endmacro %}