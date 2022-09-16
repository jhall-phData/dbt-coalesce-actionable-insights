WITH foa_info_awards AS (
    SELECT award_id,
           code
      FROM {{ source('raw_grants', 'foa_info_awards') }}
     WHERE award_id IN (SELECT award_id
                          FROM {{ source('raw_grants', 'awards') }} ) AND
           code IN (SELECT code
                      FROM {{ source('raw_grants', 'foa_info') }})
)

SELECT award_id,
       code
  FROM foa_info_awards