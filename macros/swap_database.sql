{% macro swap_database() %}
    {% set sql = 'ALTER DATABASE prod_coalesce_demo SWAP WITH test_coalesce_demo' %}
    {% do run_query(sql) %}
    {{ log("database swapped", info=True) }}
    {% set sql = 'CREATE OR REPLACE SCHEMA test_coalesce_demo.artifacts CLONE prod_coalesce_demo.artifacts' %}
    {% do run_query(sql) %}
    {{ log("Artifacts Cloned", info=True) }}
{% endmacro %}