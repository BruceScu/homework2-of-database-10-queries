select * from
(select id, ShipCountry, 'NorthAmerica' from 'Order' where id >= 15445 and ShipCountry in ('USA','Mexico','Canada')
union
select id, ShipCountry, 'OtherPlace' from 'Order' where id >= 15445 and ShipCountry not in ('USA','Mexico','Canada'))
order by id limit 20;