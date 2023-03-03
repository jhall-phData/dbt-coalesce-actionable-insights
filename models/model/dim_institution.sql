WITH institution AS (
    SELECT institution_key,
           name,
           address,
           city,
           zip_code,
           state,
           state_code,
           country,
           phone_number,
           'some_data' AS some_data
      FROM {{ ref('cln_institution') }}
)

SELECT *
  FROM institution