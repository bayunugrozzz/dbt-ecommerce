WITH get_product_category_name AS (
    SELECT
        product_category_name
        , product_category_name_english
    FROM
        {{ ref('stg_product_cat_name') }}
),

final AS (
    SELECT
        product_category_name
        , product_category_name_english
    FROM
        get_product_category_name
)

SELECT * FROM final