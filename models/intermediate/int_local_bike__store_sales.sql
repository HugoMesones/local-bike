-- Quels sont les stores avec le plus de CA ? 
-- quantity*list_price*-discount
-- 
WITH chiffre_daffaire AS (
  SELECT order_id, item_id, ROUND((quantity*list_price)-(quantity*list_price*discount),2) AS chiffre_daffaire
  FROM {{ref('stg_local_bike__order_items')}}
)

SELECT 
  o.store_id,
  s.store_name,
  s.city,
  s.state,
  o.order_id,
  o.order_status,
  o.order_date,
  o.required_date,
  o.shipped_date,
  ca.item_id,
  ca.chiffre_daffaire 
FROM {{ref('stg_local_bike__orders')}} o
LEFT JOIN {{ref('stg_local_bike__stores')}} s ON o.store_id = s.store_id
LEFT JOIN chiffre_daffaire ca ON o.order_id = ca.order_id 