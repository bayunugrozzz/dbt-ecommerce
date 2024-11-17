{% macro load_data_source (tables_name) %}
WITH add_source_data AS (
    SELECT *
    FROM {{ source('ecommerce', tables_name) }}
),

final_data AS (
    SELECT *
    FROM add_source_data
)

SELECT * FROM final_data
{% endmacro %}