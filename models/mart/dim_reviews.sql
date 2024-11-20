WITH get_data_dim_reviews AS(
    SELECT
        *
    FROM
        {{ ref('int_dims_reviews') }}
),

final AS (
    SELECT
        order_id
        , review_id
        , review_comment_title
        , review_comment_message
    FROM
        get_data_dim_reviews
)

SELECT * FROM final