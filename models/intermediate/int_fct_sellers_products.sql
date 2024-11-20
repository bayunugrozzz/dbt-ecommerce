WITH get_sellers_products AS ( 
    SELECT
        sel.seller_id
        , oi.order_id
        , pro.product_id
        , pro.product_weight_g
        , pro.product_length_cm
        , pro.product_height_cm
        , pro.product_width_cm
        , oi.shipping_limit_date
        , rev.review_score
        , rev.review_creation_date
        , rev.review_answer_timestamp


    FROM
        {{ ref('stg_sellers') }} AS sel
        LEFT JOIN {{ ref('stg_order_items') }} AS oi
            ON sel.seller_id = oi.seller_id
        LEFT JOIN {{ ref('stg_products') }} AS pro
            ON oi.product_id = pro.product_id
        LEFT JOIN {{ ref('stg_order_reviews') }} AS rev
            ON oi.order_id = rev.order_id
),

transform AS (
    SELECT
        seller_id
        , order_id
        , product_id
        , product_weight_g
        , product_length_cm
        , product_height_cm
        , product_width_cm
        , shipping_limit_date
        , review_score
        , review_creation_date
        , review_answer_timestamp
        , ROUND(EXTRACT(EPOCH FROM((review_answer_timestamp - review_creation_date)) / 3600), 1) AS review_responded_hours
        , ROUND((product_length_cm * product_height_cm * product_width_cm) / 1000, 1) AS product_volume_cm3
        , ROUND(product_weight_g / 1000, 1) AS product_weight_kg
    FROM 
        get_sellers_products
),

final AS (
    SELECT
        seller_id
        , order_id
        , product_id
        , product_weight_kg
        , product_volume_cm3
        , shipping_limit_date
        , review_score
        , review_responded_hours
    FROM 
        transform
)

SELECT * FROM final