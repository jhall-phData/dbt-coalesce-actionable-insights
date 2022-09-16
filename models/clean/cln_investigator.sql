WITH investigator AS (
    SELECT email_id,
           first_name,
           last_name
      FROM {{ source('raw_grants', 'investigator') }}
)

SELECT email_id,
       first_name,
       last_name
  FROM investigator