SELECT CAST(category_id AS int) AS category_id, CAST(category_name as string) AS category_name
FROM {{source("local_bike_project",'categories')}}