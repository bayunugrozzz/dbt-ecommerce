WITH add_seeds AS (
    SELECT *
    FROM {{ ref('product_category_name')}}
),

final_data AS (
    SELECT *
    FROM add_seeds
)

SELECT * FROM final_data