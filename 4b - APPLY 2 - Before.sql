USE AdventureWorksDW2017;

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
 SUBSTRING
			(
			MyKeyValues.KeyValue
			,CHARINDEX('-',MyKeyValues.KeyValue) + 1
			,CHARINDEX	('-'
						,MyKeyValues.KeyValue
						,CHARINDEX('-',MyKeyValues.KeyValue) + 1
						) 
			- CHARINDEX('-',MyKeyValues.KeyValue) - 1
						) As CentreKey
, COUNT(*) AS KeyCount
FROM MyKeyValues
WHERE LEN(
 SUBSTRING
			(
			MyKeyValues.KeyValue
			,CHARINDEX('-',MyKeyValues.KeyValue) + 1
			,CHARINDEX	(	'-'
						,MyKeyValues.KeyValue
						,CHARINDEX('-',MyKeyValues.KeyValue) + 1
						) 
			- CHARINDEX('-',MyKeyValues.KeyValue) - 1
						)
			) > 3
GROUP BY
 SUBSTRING
			(
			MyKeyValues.KeyValue
			,CHARINDEX('-',MyKeyValues.KeyValue) + 1
			,CHARINDEX	(	'-'
						,MyKeyValues.KeyValue
						,CHARINDEX('-',MyKeyValues.KeyValue) + 1
						) 
			- CHARINDEX('-',MyKeyValues.KeyValue) - 1
						);