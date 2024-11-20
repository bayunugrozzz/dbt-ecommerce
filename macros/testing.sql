{% macro test_no_duplicates(model, columns) %}
WITH get_data AS (
    SELECT 
        {{ columns | join(', ') }} 
    FROM {{ model }}
),

validation AS (
    SELECT
        {{ columns | join(', ') }},
        COUNT(*) AS count_rows
    FROM 
        get_data
    GROUP BY 
        {{ columns | join(', ') }}
    HAVING 
        COUNT(*) > 1
)

SELECT 
    COUNT(*) AS num_duplicated_rows
FROM 
    validation
HAVING 
    COUNT(*) > 0
{% endmacro %}
