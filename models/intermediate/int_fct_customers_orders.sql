WITH get_customers_orders AS (
    SELECT
        cus.customer_id
        , ord.order_id
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

transform AS (
    SELECT
        customer_id
        , order_id
        , ROUND(EXTRACT(EPOCH FROM (order_approved_at::TIMESTAMP - order_purchase_timestamp::TIMESTAMP)) / 60, 1) AS time_to_approved_minutes
        , ROUND(EXTRACT(EPOCH FROM (order_delivered_customer_date::TIMESTAMP - order_delivered_carrier_date::TIMESTAMP)) / 3600, 1) AS  time_carrier_delivered_hours
        , ROUND(EXTRACT(EPOCH FROM (order_delivered_customer_date::TIMESTAMP - order_approved_at::TIMESTAMP)) / 3600, 1) AS time_approved_to_delivered_hours
        , ROUND(EXTRACT(EPOCH FROM (order_delivered_carrier_date::TIMESTAMP - order_approved_at::TIMESTAMP)) / 3600, 1) AS approved_to_carrier_delivery_hours
        , ROUND(EXTRACT(EPOCH FROM ((order_estimated_delivery_date::TIMESTAMP - order_approved_at::TIMESTAMP) - (order_delivered_customer_date - order_approved_at))) / 3600, 1) AS different_estimated_delivered_hours
    FROM
        get_customers_orders
),

final AS (
    SELECT
        customer_id
        , order_id
        , time_to_approved_minutes
        , time_carrier_delivered_hours
        , time_approved_to_delivered_hours
        , approved_to_carrier_delivery_hours
        , different_estimated_delivered_hours
    FROM    
        transform
)

SELECT * FROM final
 