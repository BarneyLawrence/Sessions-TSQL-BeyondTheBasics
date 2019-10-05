/*
SSMS Options
Environment > Tabs and Windows - Pinned Tabs in Seperate Row
Text Editor > All Languages > General - Line Numbers
Text Editor > All Languages > Scroll Bars - Map Mode
Text Editor > Editor Tab and Status Bar - Status Bar Location = Top
Text Editor > Editor Tab and Status Bar - Tap Text = Filename Only

Query Results > SQL Server > Results to Grid - Retain CR\LF on copy or save
Query Results > SQL Server > Results to Grid - XML data = Unlimited
Query Results > SQL Server > Results to Grid - Display Results in a Seperate Tab

SQL Server Object Explorer > Scripting - Data Compression Options = True

Environment > Keyboard > Query Shortcuts
	'SELECT TOP 100 * FROM '
	'SELECT COUNT(*) FROM '
(remember the space at the end)
*/

USE AdventureWorksDW2017

SELECT *
FROM dbo.DimCustomer AS C
INNER JOIN dbo.FactInternetSales AS S
	ON C.CustomerKey = S.CustomerKey
	AND C.DateFirstPurchase = S.OrderDate
WHERE S.TotalProductCost > 5

