SELECT 
  c.customer_id,
  c.first_name,
  c.last_name,
  c.city,
  c.state,
  c.zip_code,
  o.order_id,
  oi.product_id,
  ROUND(SUM((oi.quantity*oi.list_price)-(oi.quantity*oi.list_price*oi.discount)),2) AS chiffre_daffaire
FROM {{ref('stg_local_bike__customers')}} c
LEFT JOIN {{ref('stg_local_bike__orders')}} o ON c.customer_id = o.customer_id
LEFT JOIN {{ref('stg_local_bike__order_items')}} oi ON o.order_id = oi.order_id
GROUP BY customer_id, first_name, last_name, city, state, zip_code, order_id, product_id