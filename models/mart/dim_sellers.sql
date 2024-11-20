WITH get_data_dim_sellers AS(
    SELECT
        *
    FROM
        {{ ref('int_dims_sellers') }}
),

final AS (
    SELECT
        seller_id
        , seller_zip_code_prefix
        , seller_city
        , seller_state
    FROM
        get_data_dim_sellers
)

SELECT * FROM final