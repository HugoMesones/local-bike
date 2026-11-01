-- Quels sont les stores avec le plus de CA ? 
-- Délais/retards de livraison 

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
  oi.product_id,
  oi.chiffre_daffaire 
FROM {{ref('stg_local_bike__orders')}} o
LEFT JOIN {{ref('stg_local_bike__stores')}} s ON o.store_id = s.store_id
LEFT JOIN {{ref('stg_local_bike__order_items')}} oi ON o.order_id = oi.order_id 