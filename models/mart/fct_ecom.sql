WITH extracted_columns_fct_int AS(
    SELECT
        co.customer_id
        , co.order_id
        , sp.seller_id
        , sp.product_id
        , cp.payment_installments
        , cp.payment_sequential
        , cp.payment_value
        , cp.total_price
        , cp.payment_percentage
        , sp.product_weight_kg
        , sp.product_volume_cm3
        , sp.shipping_limit_date
        , sp.review_score
        , sp.review_responded_hours
        , co.time_to_approved_minutes
        , co.time_carrier_delivered_hours
        , co.time_approved_to_delivered_hours
        , co.approved_to_carrier_delivery_hours
        , co.different_estimated_delivered_hours
        , ROW_NUMBER() OVER (PARTITION BY co.order_id, sp.product_id ORDER BY sp.shipping_limit_date DESC) AS row_num

    FROM
        {{ ref('int_fct_customers_orders') }} AS co
        LEFT JOIN {{ ref('int_fct_customers_payments') }} AS cp
            ON co.order_id = cp.order_id AND co.customer_id = cp.customer_id
        LEFT JOIN {{ ref('int_fct_sellers_products') }} AS sp
            ON cp. order_id = sp.order_id
),

final AS (
    SELECT
        customer_id
        , order_id
        , coalesce(seller_id, 'unknown') AS seller_id
        , coalesce(product_id, 'unknown') AS product_id
        , payment_installments
        , payment_sequential
        , payment_value
        , total_price
        , payment_percentage
        , product_weight_kg
        , product_volume_cm3
        , shipping_limit_date
        , review_score
        , review_responded_hours
        , time_to_approved_minutes
        , time_carrier_delivered_hours
        , time_approved_to_delivered_hours
        , approved_to_carrier_delivery_hours
        , different_estimated_delivered_hours
    FROM
        extracted_columns_fct_int
    WHERE
        row_num = 1
)

SELECT * FROM final



