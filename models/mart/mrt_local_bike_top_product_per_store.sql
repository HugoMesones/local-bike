SELECT store_id, store_name, state, store.product_id, p.product_name, p.brand_name, p.category_name, p.model_year, RANK() OVER (PARTITION BY store_id ORDER BY SUM(chiffre_daffaire) DESC) AS ranking, ROUND(SUM(chiffre_daffaire),2) as total_sales 
FROM {{ref('int_local_bike__store_sales')}} store
LEFT JOIN {{ref('int_local_bike__products')}} p ON store.product_id = p.product_id
GROUP BY store_id, store_name, state, product_id, p.product_name, p.brand_name, p.category_name, p.model_year
QUALIFY ranking < 4