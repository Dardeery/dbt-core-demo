
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

with trip_details as (

 select VendorID as uuid,
    case when payment_type = 1 then "cash"
         when payment_type = 2 then "card"
         end as payment_method,
    fare_amount,
    fare_amount as total_amount,
    total_amount as trip_duration
from `sql-for-bigquery3.Testing.trips`
)

select *
from trip_details

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
