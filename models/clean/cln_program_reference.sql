WITH program_reference AS (
    SELECT code,
           text AS desc
      FROM {{ source('raw_grants', 'program_reference') }}
)

SELECT code,
       desc
  FROM program_reference