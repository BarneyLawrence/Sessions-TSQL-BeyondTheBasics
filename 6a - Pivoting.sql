USE AdventureWorksDW2019;

WITH CategorySales AS
(
SELECT PC.EnglishProductCategoryName AS Category, Year(S.OrderDate) AS OrderYear, S.SalesAmount
FROM dbo.FactResellerSales AS S
INNER JOIN dbo.DimProduct AS P
	ON S.ProductKey = P.ProductKey
INNER JOIN dbo.DimProductSubcategory AS PS
	ON PS.ProductSubcategoryKey = P.ProductSubcategoryKey
INNER JOIN dbo.DimProductCategory AS PC
	ON PC.ProductCategoryKey = PS.ProductCategoryKey
)
SELECT OrderYear,
SUM(SalesAmount) AS TotalSales,

SUM(CASE WHEN Category = 'Bikes' THEN SalesAmount ELSE NULL END) AS BikesSales,
SUM(CASE WHEN Category = 'Bikes' THEN SalesAmount END) AS BikesSales2,
SUM(IIF(Category = 'Bikes',SalesAmount,NULL)) AS BikesSales3,

SUM(IIF(Category = 'Components',SalesAmount,NULL)) AS ComponentsSales,
SUM(IIF(Category = 'Clothing',SalesAmount,NULL)) AS ClothingSales,
SUM(IIF(Category = 'Accessories',SalesAmount,NULL)) AS AccessoriesSales
FROM CategorySales
GROUP BY OrderYear
ORDER BY OrderYear;