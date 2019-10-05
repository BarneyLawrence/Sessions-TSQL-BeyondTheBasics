USE AdventureWorksDW2017;

WITH MaxChildren AS
(
SELECT S.ProductKey, MAX(C.TotalChildren) AS MaxChildren
FROM dbo.FactInternetSales AS S
INNER JOIN dbo.DimCustomer AS C
	ON S.CustomerKey = C.CustomerKey
GROUP BY S.ProductKey
	),
MaxBirth AS
(
SELECT S.ProductKey, MAX(C.TotalChildren) AS MaxChildren, MAX(C.BirthDate) as MaxBirth
FROM dbo.FactInternetSales AS S
INNER JOIN dbo.DimCustomer AS C
	ON S.CustomerKey = C.CustomerKey
INNER JOIN MaxChildren AS M
	ON S.ProductKey = M.ProductKey
	AND C.TotalChildren = M.MaxChildren
GROUP BY S.ProductKey
), 
MinCustomer AS
(
SELECT S.ProductKey, MAX(C.TotalChildren) AS MaxChildren, MAX(C.BirthDate) as MaxBirth,MIN(C.CustomerKey) AS MinCustomer
FROM dbo.FactInternetSales AS S
INNER JOIN dbo.DimCustomer AS C
	ON S.CustomerKey = C.CustomerKey
INNER JOIN MaxBirth AS M
	ON S.ProductKey = M.ProductKey
	AND C.TotalChildren = M.MaxChildren
	AND M.MaxBirth = C.BirthDate
GROUP BY S.ProductKey
)
SELECT S.ProductKey, C.CustomerKey
FROM dbo.FactInternetSales AS S
INNER JOIN dbo.DimCustomer AS C
	ON S.CustomerKey = C.CustomerKey
INNER JOIN MinCustomer AS M
	ON S.ProductKey = M.ProductKey
	AND C.TotalChildren = M.MaxChildren
	AND C.BirthDate = M.MaxBirth
	AND C.CustomerKey = M.MinCustomer
ORDER BY ProductKey, CustomerKey;
