WITH get_reviews AS (
    SELECT
        order_id,
        review_id,
        review_comment_title,
        review_comment_message
    FROM
        {{ ref('stg_order_reviews') }}
),

transform AS (
    SELECT
        order_id
        , review_id
        , COALESCE(review_comment_title, 'no review title') AS review_comment_title
        , COALESCE(review_comment_message, 'no review message') AS review_comment_message
    FROM
        get_reviews
),

final AS (
    SELECT
        order_id
        , review_id
        , review_comment_title
        , review_comment_message
    FROM
        transform
)

SELECT * FROM final 