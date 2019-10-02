USE AdventureWorksDW2017;

WITH CustomersOrdered AS
(SELECT S.ProductKey, C.CustomerKey, C.TotalChildren, C.BirthDate
, ROW_NUMBER() OVER (PARTITION BY S.ProductKey ORDER BY C.TotalChildren DESC, C.BirthDate DESC, C.CustomerKey ASC) AS CustomerSequence
FROM dbo.FactInternetSales AS S
INNER JOIN dbo.DimCustomer AS C
	ON S.CustomerKey = C.CustomerKey
	)
SELECT ProductKey, CustomerKey
FROM CustomersOrdered
WHERE CustomerSequence = 1
ORDER BY ProductKey, CustomerKey;