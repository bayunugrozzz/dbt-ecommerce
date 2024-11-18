WITH get_customers_payments AS ( 
    SELECT
        cus.customer_id
        , cus.customer_city
        , cus.customer_state
        , ord.order_id
        , ord.order_status
        , ord.order_purchase_timestamp
        , pay.payment_type
        , pay.payment_installments
        , pay.payment_value
        , oi.price
        , oi.freight_value
    FROM
        {{ ref('stg_customers') }} AS cus
        LEFT JOIN {{ ref('stg_orders') }} AS ord
            ON cus.customer_id = ord.customer_id
        LEFT JOIN {{ ref('stg_order_payments') }} AS pay
            ON ord.order_id = pay.order_id
        LEFT JOIN {{ ref('stg_order_items') }} AS oi
            ON ord.order_id = oi.order_id
),

transform AS (
        SELECT
            customer_id
            , order_id
            , customer_city
            , customer_state
            , order_purchase_timestamp
            , order_status
            , COALESCE(payment_type, 'not_defined') AS payment_type
            , COALESCE(payment_installments, -1) AS payment_installments
            , COALESCE(payment_value, 0) AS payment_value
            , COALESCE(ROUND(price + freight_value, 2), 0) AS total_price
            , COALESCE(ROUND(NULLIF(payment_value, 0)::NUMERIC / NULLIF((price + freight_value), 0)::NUMERIC * 100, 2), 0) AS payment_percentage
            , COALESCE(GREATEST(ROUND((1 - NULLIF(payment_value, 0)::NUMERIC / NULLIF((price + freight_value), 0)::NUMERIC) * 100, 2), 0), 0) AS discount_percentage
            , COALESCE(GREATEST(ROUND((NULLIF((price + freight_value), 0)::NUMERIC - NULLIF(payment_value, 0)::NUMERIC), 2), 0), 0) AS discount_value
            , COALESCE(ROUND(GREATEST(NULLIF(payment_value, 0)::NUMERIC - (price + freight_value), 0), 2), 0) AS total_interest
            , COALESCE(ROUND(GREATEST(NULLIF(payment_value, 0)::NUMERIC - (price + freight_value), 0) / (price + freight_value) * 100, 2), 0) AS interest_percentage   
        FROM    
            get_customers_payments
        ORDER BY
            order_purchase_timestamp
)

SELECT * FROM transform