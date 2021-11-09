USE AdventureWorksDW2019;

SELECT [CustomerKey],[EnglishEducation],[SpanishEducation],[FrenchEducation],[EnglishOccupation],[SpanishOccupation],[FrenchOccupation]
FROM dbo.DimCustomer AS S;

SELECT CustomerKey, 'EnglishEducation' AS PropertyName , EnglishEducation AS PropertyValue   
FROM dbo.DimCustomer  
UNION ALL  
SELECT CustomerKey, 'EnglishOccupation' AS PropertyName , EnglishOccupation AS PropertyValue   
FROM dbo.DimCustomer  
UNION ALL  
SELECT CustomerKey, 'FrenchEducation' AS PropertyName , FrenchEducation AS PropertyValue   
FROM dbo.DimCustomer  
UNION ALL  
SELECT CustomerKey, 'FrenchOccupation' AS PropertyName , FrenchOccupation AS PropertyValue   
FROM dbo.DimCustomer  
UNION ALL  
SELECT CustomerKey, 'SpanishEducation' AS PropertyName , SpanishEducation AS PropertyValue   
FROM dbo.DimCustomer  
UNION ALL  
SELECT CustomerKey, 'SpanishOccupation' AS PropertyName , SpanishOccupation AS PropertyValue   
FROM dbo.DimCustomer  
ORDER BY CustomerKey, PropertyName;