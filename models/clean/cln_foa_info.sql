WITH foa_info AS (
    SELECT code,
           name
      FROM {{ source('raw_grants', 'foa_info') }}
)

SELECT code,
       name
  FROM foa_info