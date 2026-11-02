WITH sales_per_customer as (
    SELECT customer_id, SUM(chiffre_daffaire) as somme_ca
    FROM {{ref('mrt_local_bike_product_bought_per_customer')}}
    GROUP BY customer_id
),

thresholds as (
  SELECT 
    APPROX_QUANTILES(somme_ca, 100)[OFFSET(90)] AS somme_ca_threshold
  FROM sales_per_customer
),

top_customers as (
  SELECT customer_id 
  FROM sales_per_customer sc
  CROSS JOIN thresholds t
  WHERE somme_ca >= somme_ca_threshold)

SELECT *
FROM {{ref('mrt_local_bike_product_bought_per_customer')}}
WHERE customer_id IN (SELECT * from top_customers)