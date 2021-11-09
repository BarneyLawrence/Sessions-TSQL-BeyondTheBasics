USE AdventureWorksDW2019;

SELECT *
FROM sys.columns AS C
INNER JOIN sys.types AS T
	ON C.system_type_id = T.system_type_id
WHERE OBJECT_NAME(C.object_id) = 'FactInternetSales'
AND T.name = 'money';

SELECT *
FROM dbo.FactInternetSales









