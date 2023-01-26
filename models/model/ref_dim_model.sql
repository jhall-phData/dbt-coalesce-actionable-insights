SELECT *
  FROM  {{ ref('dbt_artifacts', 'dim_dbt__models') }}