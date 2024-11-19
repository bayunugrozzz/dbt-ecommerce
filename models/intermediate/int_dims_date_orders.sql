WITH get_dims_date_orders AS (
    SELECT
        order_id
        , order_purchase_timestamp
        , order_approved_at
        , order_delivered_carrier_date
        , order_delivered_customer_date
        , order_estimated_delivery_date
    FROM
        {{ ref('stg_orders') }}
),

transform AS (
    SELECT
        order_id
        , order_purchase_timestamp::TIMESTAMP
        , order_approved_at::TIMESTAMP
        , order_delivered_carrier_date::TIMESTAMP
        , order_delivered_customer_date::TIMESTAMP
        , order_estimated_delivery_date::TIMESTAMP
    FROM
        get_dims_date_orders
),

final AS (
    SELECT
        order_id
        , order_purchase_timestamp
        , order_approved_at
        , order_delivered_carrier_date
        , order_delivered_customer_date
        , order_estimated_delivery_date
    FROM
        transform
)

SELECT * FROM final