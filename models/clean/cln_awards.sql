WITH awards AS (
    SELECT award_title,
           TO_DATE(award_effective_date, 'MM/DD/YYYY') AS award_effective_date,
           TO_DATE(award_expiration_date, 'MM/DD/YYYY') AS awarc_expiration_date,
           award_amount,
           award_instrument,
           organisation_code,
           program_officer,
           abstract_narration,
           TO_DATE(min_amd_letter_date, 'MM/DD/YYYY') AS min_amd_letter_date,
           TO_DATE(max_amd_letter_date, 'MM/DD/YYYY') AS max_amd_letter_date,
           arra_amount,
           award_id
      FROM {{ source('raw_grants', 'awards')}}
)

SELECT *
  FROM awards