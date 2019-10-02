USE AdventureWorksDW2017;

WITH TopProduct AS
(
SELECT TOP 1 ProductKey,SUM(OrderQuantity) AS TotalQuantity
FROM dbo.FactInternetSales
GROUP BY ProductKey
ORDER BY SUM(OrderQuantity) DESC
),
TopProductCustomers AS
(
SELECT DISTINCT C.CustomerKey
FROM dbo.FactInternetSales AS C
INNER JOIN TopProduct AS P
ON C.ProductKey = P.ProductKey
)
SELECT AVG(DC.YearlyIncome)
FROM dbo.DimCustomer as DC
INNER JOIN TopProductCustomers AS C
ON DC.CustomerKey = C.CustomerKey;