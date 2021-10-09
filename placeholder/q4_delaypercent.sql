select s1.CompanyName, round(a1*100.0/a2,2) as percentage
from (select CompanyName, count(*) as a1 
    from Shipper, 'Order' 
    where Shipvia = Shipper.id and ShippedDate > RequiredDate 
    group by CompanyName) s1, 

    (select CompanyName, count(*) as a2 
    from Shipper, 'Order' 
    where Shipvia = Shipper.id 
    group by CompanyName) s2
where s1.CompanyName = s2.CompanyName
order by percentage desc;