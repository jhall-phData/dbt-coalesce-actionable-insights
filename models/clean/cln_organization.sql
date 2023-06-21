WITH organization AS (
    SELECT code,
           {{ dbt_utils.surrogate_key(['code']) }} AS organization_key,
           division,
           directorate
      FROM {{ source('raw_grants', 'organization') }}
)
-- comment here
-- second comment
SELECT code,
       organization_key,
       division,
       directorate,
       'TEST' as random_str
  FROM organization