select
        order_id,
        item_id,
        product_id,
        quantity,
        list_price,
        discount,
        ROUND((quantity*list_price)-(quantity*list_price*discount),2) AS chiffre_daffaire
from {{ source('local_bike_project', 'order_items') }}