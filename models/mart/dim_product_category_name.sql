WITH get_data_product_category_name AS(
    SELECT
        *
    FROM
        {{ ref('int_dims_product_category_name') }}
),

final AS (
    SELECT
        product_category_name
        , product_category_name_english
    FROM
        get_data_product_category_name
)

SELECT * FROM final