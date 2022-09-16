WITH organization AS (
    SELECT code,
           division,
           directorate
      FROM {{ source('raw_grants', 'organization') }}
)

SELECT code,
       division,
       directorate
  FROM organization