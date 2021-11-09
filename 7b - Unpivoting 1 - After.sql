USE AdventureWorksDW2019;

SELECT S.CustomerKey,U.PropertyType,U.PropertyValue
FROM dbo.DimCustomer AS S
CROSS APPLY
(
VALUES 
	 ('EnglishEducation',S.EnglishEducation)
	,('SpanishEducation',S.SpanishEducation)
	,('FrenchEducation',S.FrenchEducation)
	,('EnglishOccupation',S.EnglishOccupation)
	,('SpanishOccupation',S.SpanishOccupation)
	,('FrenchOccupation',S.FrenchOccupation)
) AS U(PropertyType, PropertyValue)
ORDER BY CustomerKey,U.PropertyType;