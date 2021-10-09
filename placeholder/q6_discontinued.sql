select ProductName, CompanyName, ContactName
from Product, OrderDetail, 'Order', Customer, (select min('Order'.OrderDate) as Date_, ProductId
        from Product, OrderDetail, 'Order', Customer
        where Product.Id = OrderDetail.ProductId and OrderDetail.OrderId = 'Order'.Id and 'Order'.CustomerId = Customer.Id and Product.Discontinued = 1
        group by ProductName) A
where Product.Id = OrderDetail.ProductId and OrderDetail.OrderId = 'Order'.Id and 'Order'.CustomerId = Customer.Id 
    and Product.Discontinued = 1 and A.ProductId = Product.Id and 'Order'.OrderDate = A.Date_
group by ProductName
order by ProductName;