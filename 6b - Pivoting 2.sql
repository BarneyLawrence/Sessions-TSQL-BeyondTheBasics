USE AdventureWorksDW2019;

WITH CategorySales AS
(
SELECT PC.EnglishProductCategoryName AS Category, Year(S.OrderDate) AS OrderYear, S.SalesAmount, R.NumberEmployees
FROM dbo.FactResellerSales AS S
INNER JOIN dbo.DimProduct AS P
	ON S.ProductKey = P.ProductKey
INNER JOIN dbo.DimProductSubcategory AS PS
	ON PS.ProductSubcategoryKey = P.ProductSubcategoryKey
INNER JOIN dbo.DimProductCategory AS PC
	ON PC.ProductCategoryKey = PS.ProductCategoryKey
INNER JOIN dbo.DimReseller AS R
	ON S.ResellerKey = R.ResellerKey
)


SELECT OrderYear,
SUM(SalesAmount) AS TotalSales,
SUM(IIF(Category = 'Bikes',SalesAmount,NULL)) AS BikesSales,
SUM(IIF(Category = 'Components',SalesAmount,NULL)) AS ComponentsSales,
SUM(IIF(Category = 'Clothing',SalesAmount,NULL)) AS ClothingSales,
SUM(IIF(Category = 'Accessories',SalesAmount,NULL)) AS AccessoriesSales,

SUM(IIF(NumberEmployees < 50 ,SalesAmount,NULL)) AS SmallReseller,
SUM(IIF(NumberEmployees >= 50 ,SalesAmount,NULL)) AS LargeReseller,


SUM(IIF(Category = 'Bikes' AND NumberEmployees < 50 ,SalesAmount,NULL)) AS SmallResellerBikes,
SUM(IIF(Category = 'Bikes' AND NumberEmployees >= 50 ,SalesAmount,NULL)) AS LargeResellerBikes

FROM CategorySales
GROUP BY OrderYear
ORDER BY OrderYear;