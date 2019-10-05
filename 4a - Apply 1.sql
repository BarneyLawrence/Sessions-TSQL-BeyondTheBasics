USE AdventureWorksDW2017;

SELECT C.CustomerKey, FS.SalesOrderNumber, FS.TotalProductCost
FROM dbo.DimCustomer AS C
OUTER APPLY (
	SELECT TOP 1 *
	FROM dbo.FactInternetSales AS S
	WHERE S.TotalProductCost > 5
	AND C.CustomerKey = S.CustomerKey
	AND C.DateFirstPurchase = S.OrderDate
	ORDER BY S.TotalProductCost DESC, S.SalesOrderNumber DESC
	) AS FS;