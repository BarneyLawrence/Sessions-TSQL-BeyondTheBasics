USE AdventureWorksDW2017;

SELECT SalesOrderNumber, S.OrderDate,S.DueDate,S.ShipDate
FROM dbo.FactInternetSales AS S;

SELECT SalesOrderNumber, S.OrderDate,S.DueDate,S.ShipDate, MaxDate.MaxDate
FROM dbo.FactInternetSales AS S
CROSS APPLY
(
	SELECT MAX(MyDATE) AS MaxDate
	FROM
	(VALUES 
		(OrderDate),
		(DueDate),
		(ShipDate)
	) AS AllDates(MyDate)
) AS MaxDate;