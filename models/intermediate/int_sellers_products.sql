WITH get_sellers_products AS ( 
    SELECT
        sel.seller_id,
        oi.order_id,
        pro.product_id

    FROM
        {{ ref('stg_sellers') }} AS sel
        LEFT JOIN {{ ref('stg_order_items') }} AS oi
            ON sel.seller_id = oi.seller_id
        LEFT JOIN {{ ref('stg_products') }} AS pro
            ON oi.product_id = pro.product_id
        LEFT JOIN {{ ref('stg_order_reviews') }} AS rev
            ON oi.order_id = rev.order_id
)

SELECT * FROM get_sellers_products