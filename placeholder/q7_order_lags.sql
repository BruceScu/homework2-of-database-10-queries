select *, round(julianday(OrderDate) - julianday(previousDate),2)
from (select id, OrderDate, lag(OrderDate, 1, OrderDate) over (order by OrderDate) as previousDate
    from 'Order' 
    where 'Order'.CustomerId = 'BLONP' order by OrderDate limit 10)
order by OrderDate;