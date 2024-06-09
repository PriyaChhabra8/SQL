
/*
Functions in SQL:

Logical - CASE WHEN THEN

Syntax -
CASE
WHEN Condition1 THEN Value1
WHEN Condition2 THEN Value2
...
ELSE ValueN
END AS Alias_Name

Aggregation - SUM, MIN, MAX, AVG, COUNT, VAR, STDDEV [Point Estimates]
Text - LEFT, RIGHT, MID|SUBSTR|SUBSTRING, UPPER, LOWER, PROPER|CAPITALIZE, LEN, STUFF, REPLACE, FIND|CHARINDEX, TRIM, RTRIM, LTRIM
DateTime - YEAR, MONTH, DAY, HOUR, MIN, SECOND, NOW|TODAY|GETDATE, GETDATEFROMPART, DATE, DATEPART, DATENAME, DATEDIFF, DATEADD

Datediff
				Logical Diff		Datediff(year)
1 Jan 2021		
31 Dec 2021		365 days (1 year)	0 year
1 Jan 2022		1 day(~0 year)		1 year

Math - ROUND, FLOOR, CEIL|CEILING, POWER|POW, ABS
Data type conversion - CAST, CONVERT

Conversion are of 2 types:
	1. Implicit conversion [System-defined] - It's unreliable
	2. Explicit Conversion [User-defined] - Full control over the output. It's more preferred

Order of execution in conversion function:

String -> float -> int -> bool -- Can be doable based subject to condition
	Note: 1. Only non standard numerics can be converted to numbers
			Ex - '1234.5', '89.67'
String <- float <- int <- bool -- Easily doable

Data time format:

	in format dates - mm/dd/yyyy HH:mm:ss| yyyy/mm/dd HH:mm:ss
	display format - yyyy-mm-dd HH:mm:ss

Window Functions - 
	a. Aggregation Window Function - SUM, MIN, MAX, AVG, COUNT
	b. Ranking Window Function - ROW_NUMBER, DENSE_RANK, RANK
	c. Value Window Function - LAG, LEAD
*/

--Q17: Functions in SQL

-- Application of Aggregation functions

SELECT
SUM(SALES) AS TotalSales,
AVG(SALES) AS AvgSales,
MIN(SALES) AS MinSales,
COUNT(*) AS Totaltransaction,
COUNT(SALES) AS  TOTALSALESTRANS
FROM TBL_ORDER;


-- Difference between COUNT(*) vs COUNT(Col_name)

/*

COUNT(*):

Counts the total number of rows in a table, regardless of whether any specific column contains NULL values.
It considers all rows, including those with NULL values.
Useful when you want to count the total records in a table.

COUNT(col_name):

Counts the number of non-NULL values in the specified column.
Excludes rows where the specified column has NULL values.
Useful when you want to count non-NULL values in a specific column. */

-- Application of Aggregation function with GROUP BY (Array Function)

SELECT CATEGORY, PRODUCT,
SUM(SALES) AS Total
COUNT(*) AS TotalTrans
FROM TBL_ORDER
GROUP BY CATEGORY, PRODUCT;Sales,
AVG(SALES) AS AverageSales,
MIN(SALES) AS MinSales,
MAX(SALES) AS MaxSales,

-- Application of logical function

SELECT *,
CASE
WHEN SALES >= 8000 THEN 'Premium Sales'
WHEN SALES BETWEEN 4000 AND 8000 THEN 'High Sales'
ELSE 'Low Sales'
END AS SalesCategory
FROM TBL_ORDER;


SELECT *,
CASE
WHEN SALES >= 8000 THEN 'Premium Sales'
WHEN SALES BETWEEN 4000 AND 8000 THEN 'High Sales'
ELSE 'Low Sales'
END AS SalesCategory,
CASE
WHEN PROFIT > 0 THEN 'Profit'
WHEN PROFIT < 0 THEN 'Loss'
ELSE 'At par'
END AS ProfitCategory
FROM TBL_ORDER;


