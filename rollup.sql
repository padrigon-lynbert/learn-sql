select sum(amount) as "total amount", order_date 
from transactions
GROUP BY order_date with rollup