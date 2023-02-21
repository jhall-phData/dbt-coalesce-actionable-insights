WITH organization AS (
    SELECT organization_key,
           division,
           directorate,
           'cln_organization' AS root_table
      FROM {{ ref('cln_organization') }}
)

SELECT *
  FROM organization