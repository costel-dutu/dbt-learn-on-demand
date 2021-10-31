{{ config(materialized='view') }}

with orders as (

    select
        id as order_id,
        user_id as customer_id,
        order_date,
        status

    from {{ source('DBT_CDUTU','src_orders') }}

)

select * from orders
{{ limit_data_on_dev('order_date', 1000) }}
