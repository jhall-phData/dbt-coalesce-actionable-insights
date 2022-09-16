WITH institution_awards AS (
    SELECT award_id,
           name,
           zipcode AS zip_code
      FROM {{ source('raw_grants', 'institution_awards') }}
     WHERE award_id IN (SELECT award_id
                          FROM {{ source('raw_grants', 'awards') }} ) AND
           (name, zipcode) IN (SELECT name,
                                      zipcode
                                 FROM {{ source('raw_grants', 'institution') }} )
)

SELECT *
  FROM institution_awards