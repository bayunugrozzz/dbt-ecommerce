with get_customers_orders AS (
    SELECT
        cus.customer_id
        , cus.customer_city
        , cus.customer_state
        , ord.order_id
        , ord.order_status
        , ord.order_purchase_timestamp
        , ord.order_approved_at
        , ord.order_delivered_carrier_date
        , ord.order_delivered_customer_date
        , ord.order_estimated_delivery_date
    FROM
        {{ ref('stg_customers') }} AS cus
        RIGHT JOIN {{ ref('stg_orders') }} AS ord
            ON cus.customer_id = ord.customer_id
),

transfrorm AS (
    SELECT
        customer_id
        , customer_city
        , customer_state
        , order_id
        , order_status
        , COALESCE(ROUND(EXTRACT(EPOCH FROM (order_approved_at::TIMESTAMP - order_purchase_timestamp::TIMESTAMP)) / 60, 1), 0) AS time_to_approved_minutes
        , COALESCE(ROUND(EXTRACT(EPOCH FROM (order_delivered_customer_date::TIMESTAMP - order_delivered_carrier_date::TIMESTAMP)) / 3600, 1), 0) AS  time_carrier_delivered_hours
        , COALESCE(ROUND(EXTRACT(EPOCH FROM (order_delivered_customer_date::TIMESTAMP - order_approved_at::TIMESTAMP)) / 3600, 1), 0) AS time_approved_to_delivered_hours
        , COALESCE(ROUND(EXTRACT(EPOCH FROM (order_delivered_carrier_date::TIMESTAMP - order_approved_at::TIMESTAMP)) / 3600, 1) , 0) AS approved_to_carrier_delivery_hours
        , COALESCE(ROUND(EXTRACT(EPOCH FROM ((order_estimated_delivery_date::TIMESTAMP - order_approved_at::TIMESTAMP) - (order_delivered_customer_date - order_approved_at))) / 3600, 1), 0) AS different_estimated_delivered_hours
    FROM
        get_customers_orderS
)

SELECT * FROM transfrorm
