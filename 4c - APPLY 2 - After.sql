USE AdventureWorksDW2019;

WITH MyKeyValues AS
(
SELECT MyKey.KeyValue
FROM 
	(VALUES
		 ('15423-abcd-456')
		,('59-abcd-212')
		,('9846517-defghi-569')
		,('36329-defghi-915')
		,('2-abcd-753')
		,('1212893-hij-456')
	) AS MyKey(KeyValue)
)
SELECT 
 C.CentreKey
, COUNT(*) AS KeyCount
FROM MyKeyValues
CROSS APPLY (SELECT CHARINDEX('-',MyKeyValues.KeyValue) + 1 AS N) AS FirstDash
CROSS APPLY (SELECT CHARINDEX('-',MyKeyValues.KeyValue,FirstDash.N) AS N) AS SecondDash
CROSS APPLY (SELECT SecondDash.N - FirstDash.N AS N) AS KeyLength
CROSS APPLY (SELECT SUBSTRING(MyKeyValues.KeyValue, FirstDash.N,KeyLength.N) AS CentreKey) AS C 
WHERE LEN(C.CentreKey) > 3
GROUP BY C.CentreKey;