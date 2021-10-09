select CategoryName, kind, average, minimum, maximum, sums
from
    (select *
    from (select CategoryName, count(*) as kind, round(avg(UnitPrice),2) as average, min(UnitPrice) as minimum, max(UnitPrice) as maximum, sum(Product.UnitsOnOrder) as sums, Category.Id as id
        from Product, Category
        where Product.CategoryId = Category.Id
        group by Category.Id)
    where kind > 10

    union all

    select *
    from (select CategoryName, count(*) as kind, round(avg(UnitPrice),2) as average, min(UnitPrice) as minimum, max(UnitPrice) as maximum, NULL as sums, Category.Id as id
        from Product, Category
        where Product.CategoryId = Category.Id
        group by Category.Id)
    where kind <= 10)
order by id;