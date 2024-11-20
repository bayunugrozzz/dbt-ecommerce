WITH get_dims_orders AS (
    SELECT
        *
    FROM
        {{ ref('int_dims_orders') }}
),

final AS (
    SELECT
        order_id
        , order_status
        , payment_type
    FROM
        get_dims_orders
)

SELECT * FROM final