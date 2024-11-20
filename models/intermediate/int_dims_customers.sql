WITH get_dims_customers AS (
    SELECT
        customer_id,
        customer_unique_id,
        customer_zip_code_prefix,
        customer_city,
        customer_state
    FROM
        {{ ref('stg_customers') }}
),

transform AS (
    SELECT
        customer_id,
        customer_unique_id,
        COALESCE(customer_zip_code_prefix, '00000') AS customer_zip_code_prefix,
        COALESCE(customer_city, 'unknown') AS customer_city,
        COALESCE(customer_state, 'unknown') AS customer_state
    FROM
        get_dims_customers  
),

final AS (
    SELECT
        customer_id,
        customer_unique_id,
        customer_zip_code_prefix,
        customer_city,
        customer_state
    FROM
        transform
)

SELECT * FROM final