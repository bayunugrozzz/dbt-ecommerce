WITH dims_date_data AS (
    SELECT
        *
    FROM
        {{ ref('int_dims_date_orders') }}
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
        dims_date_data
)

SELECT * FROM final