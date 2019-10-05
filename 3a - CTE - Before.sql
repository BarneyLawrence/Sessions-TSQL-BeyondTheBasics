USE AdventureWorksDW2017;

SELECT AVG(DC.YearlyIncome)
FROM dbo.DimCustomer as DC
INNER JOIN 
(SELECT DISTINCT C.CustomerKey
FROM dbo.FactInternetSales AS C
INNER JOIN
(SELECT TOP 1 ProductKey,SUM(OrderQuantity) AS TotalQuantity
FROM dbo.FactInternetSales
GROUP BY ProductKey
ORDER BY SUM(OrderQuantity) DESC) AS P
ON C.ProductKey = P.ProductKey
) AS C
ON DC.CustomerKey = C.CustomerKey;