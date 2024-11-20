WITH get_dims_orders AS (
    SELECT
        ord.order_id
        , ord.order_status
        , pay.payment_type
    FROM
        {{ ref('stg_orders') }} AS ord
        LEFT JOIN {{ ref('stg_order_payments') }} AS pay
            ON ord.order_id = pay.order_id
),

transform AS (
    SELECT
        order_id
        , COALESCE(order_status, 'unknown') AS order_status
        , COALESCE(payment_type, 'unknown') AS payment_type
    FROM
        get_dims_orders
),

final AS (
    SELECT
        order_id
        , order_status
        , payment_type
    FROM
        transform
)   

SELECT * FROM final