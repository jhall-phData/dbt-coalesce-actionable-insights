{% macro sync_artifacts() %}
    {% set sql = 'CREATE OR REPLACE SCHEMA test_coalesce_demo.artifacts CLONE prod_coalesce_demo.artifacts' %}
    {% do run_query(sql) %}
    {{ log("Artifacts Cloned", info=True) }}
{% endmacro %}