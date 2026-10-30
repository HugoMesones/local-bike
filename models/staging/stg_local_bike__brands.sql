SELECT CAST(brand_id AS int) AS brand_id, CAST(brand_name AS string) AS brand_name
FROM {{source("local_bike_project","brands")}}