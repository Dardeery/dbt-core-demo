
-- Use the `ref` function to select from other models

-- CREATE OR REPLACE table `sql-for-bigquery3.Testing.cash_trips` as
SELECT *
from {{ ref('my_first_dbt_model') }}
where payment_method = "cash"
