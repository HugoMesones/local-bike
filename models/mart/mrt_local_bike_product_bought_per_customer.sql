SELECT 
    customer_id, 
    first_name,    
    last_name, 
    city, 
    state,
    order_id, 
    c.product_id,
    product_name, 
    brand_name, 
    category_name, 
    model_year, 
    chiffre_daffaire
FROM {{ref('int_local_bike__customers')}} c
LEFT JOIN {{ref('int_local_bike__products')}} p ON c.product_id = p.product_id