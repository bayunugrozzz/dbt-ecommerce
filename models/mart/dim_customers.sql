WITH get_data_customers_from_int AS(
    SELECT
        *
    FROM
        {{ ref('int_dims_customers') }}
),

final AS (
    SELECT
        customer_id
        , customer_unique_id
        , customer_zip_code_prefix
        , customer_city
        , customer_state
    FROM
        get_data_customers_from_int
)

SELECT * FROM final