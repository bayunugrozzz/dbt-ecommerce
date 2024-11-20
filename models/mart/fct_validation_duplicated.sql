{{ config(materialized='view') }}

WITH get_data_fct_ecom AS (
    SELECT 
        order_id,
        product_id
    FROM {{ ref('fct_ecom') }}
),

validation AS (
    SELECT
        order_id,
        product_id,
        COUNT(*) AS count_rows
    FROM 
        get_data_fct_ecom
    GROUP BY 
        order_id, product_id
    HAVING 
        COUNT(*) > 1
)

SELECT * FROM validation