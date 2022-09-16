WITH program_element AS (
    SELECT code,
           text AS desc
      FROM {{ source('raw_grants', 'program_element') }}
)

SELECT code,
       desc
  FROM program_element