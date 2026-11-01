SELECT 
  product_id,
  product_name,
  p.brand_id,
  brand_name,
  p.category_id,
  category_name,
  model_year,
  list_price
FROM {{ref('stg_local_bike__products')}} p
LEFT JOIN {{ref('stg_local_bike__brands')}} b ON p.brand_id = b.brand_id
LEFT JOIN {{ref('stg_local_bike__categories')}} c ON p.category_id = c.category_id