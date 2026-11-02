SELECT store_id, store_name, city, state, order_status, SUM(chiffre_daffaire)
FROM {{ref('int_local_bike__store_sales')}}
GROUP BY store_id, store_name, city, state, order_status