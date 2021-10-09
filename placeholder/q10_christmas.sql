with recursive cte(name_, length_, id_) as (
    values('', 0, 0)

    union

    select c.name_ || ',' || k.ProductName as name_, length(c.name_), pid as id_ from (select ProductName, Product.id as pid
        from Product, OrderDetail, 'Order', Customer
        where Customer.Id = 'Order'.CustomerId and OrderDetail.OrderId = 'Order'.Id and OrderDetail.ProductId = Product.Id and CompanyName = 'Queen Cozinha' and OrderDate like '2014-12-25%'
        order by Product.id
        ) k, cte c
    where k.pid > c.id_
)
select substr(name_, 2, length(name_) - 1) from cte where length(name_) in (select max(length(name_)) from cte);