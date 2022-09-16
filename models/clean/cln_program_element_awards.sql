WITH program_element_awards AS (
    SELECT award_id,
           code
      FROM {{ source('raw_grants', 'program_element_awards') }}
     WHERE award_id IN (SELECT award_id
                          FROM {{ source('raw_grants', 'awards') }} ) AND
           code IN (SELECT code
                      FROM {{ source('raw_grants', 'program_element') }} )
)

SELECT award_id,
       code
  FROM program_element_awards