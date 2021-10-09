select RegionDescription, FirstName, LastName, birthdt 
from
    (select FirstName, LastName, birthDate as birthdt
    from Employee
    where birthDate in
        (select max(Employee.birthDate) as birthdt
        from ((Region join Territory on Territory.RegionId = Region.Id) join EmployeeTerritory on EmployeeTerritory.TerritoryId = Territory.Id) join Employee on EmployeeTerritory.EmployeeId = Employee.Id
        group by RegionId
        )
    )

    natural join

    (select max(Employee.birthDate) as birthdt, RegionDescription, RegionId
    from ((Region join Territory on Territory.RegionId = Region.Id) join EmployeeTerritory on EmployeeTerritory.TerritoryId = Territory.Id) join Employee on EmployeeTerritory.EmployeeId = Employee.Id
    group by RegionId
    )
order by RegionId;