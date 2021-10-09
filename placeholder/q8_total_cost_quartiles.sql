select cpn, cstmrid, total_expenditure
from (
    select ntile(4) over (order by total_expenditure) num, *
    from(
        select cstmrid, ifNULL(CompanyName, 'MISSING_NAME') as cpn, total_expenditure from(
            (select 'Order'.CustomerId as cstmrid, round(sum(OrderDetail.UnitPrice * OrderDetail.Quantity), 2) as total_expenditure
            from 'Order', OrderDetail
            where 'Order'.Id = OrderDetail.OrderId
            group by cstmrid)

            natural left outer join

            (select id as cstmrid, CompanyName
            from Customer
            group by cstmrid)
        )
    )
)
where num = 1;