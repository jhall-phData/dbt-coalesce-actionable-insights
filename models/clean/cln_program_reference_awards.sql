WITH program_reference_awards AS (
    SELECT award_id,
           code
      FROM {{ source('raw_grants', 'program_reference_awards') }}
     WHERE award_id IN (SELECT award_id
                          FROM {{ source('raw_grants', 'awards') }} ) AND
           code IN (SELECT code
                      FROM {{ source('raw_grants', 'program_reference') }} )
)

SELECT award_id,
       code
  FROM program_reference_awards