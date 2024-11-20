WITH get_sellers AS (
    SELECT
        seller_id,
        seller_zip_code_prefix,
        seller_city,
        seller_state    
    FROM 
        {{ ref('stg_sellers') }}    
),

transform AS (
    SELECT
        seller_id
        , COALESCE(seller_zip_code_prefix, '00000') as seller_zip_code_prefix
        , COALESCE(seller_city, 'unknown') as seller_city
        , COALESCE(seller_state, 'unknown') as seller_state
    FROM
        get_sellers
),

final AS (
    SELECT
        seller_id
        , seller_zip_code_prefix
        , seller_city
        , seller_state
    FROM
        transform
)   

SELECT * FROM final
