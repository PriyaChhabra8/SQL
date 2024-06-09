--Creating Tables and loading data


CREATE TABLE TBL_ORDER (
REF_NO CHAR(14) NOT NULL,
ORD_DTE DATE NOT NULL DEFAULT '01/01/1990',
CUST_NAME VARCHAR(50) NOT NULL,
CATEGORY VARCHAR(20) NOT NULL,
PRODUCT VARCHAR(20) NOT NULL,
SALES NUMERIC(18,5),
PROFIT FLOAT
);

INSERT INTO TBL_ORDER VALUES
('CA-2012-124891', '7/31/2012', 'Rick Hansen', 'Technology', 'Accessories', 2309.65, 762.1845), 
('CA-2014-135909', '10/14/2014', 'Jane Waco', 'Office Supplies', 'Binders', 5083.96, 1906.485), 
('CA-2012-116638', '1/28/2012', 'Joseph Holt', 'Furniture', 'Tables', 4297.644, -1862.3124), 
('CA-2014-143567', '11/3/2014', 'Thomas Boland', 'Technology', 'Accessories', 2249.91, 517.4793), 
('CA-2011-154627', '10/29/2011', 'Sue Ann Reed', 'Technology', 'Phones', 2735.952, 341.994), 
('CA-2013-159016', '3/11/2013', 'Karen Ferguson', 'Technology', 'Phones', 4158.912, 363.9048), 
('CA-2012-139731', '10/15/2012', 'Joel Eaton', 'Furniture', 'Chairs', 2453.43, -350.49), 
('CA-2011-168494', '12/12/2011', 'Nora Preis', 'Furniture', 'Tables', 3610.848, 135.4068), 
('CA-2011-160766', '9/14/2011', 'Darrin Martin', 'Technology', 'Machines', 2799.96, 1371.9804), 
('US-2014-168116', '11/5/2014', 'Grant Thornton', 'Technology', 'Machines', 7999.98, -3839.9904), 
('CA-2011-116904', '9/23/2011', 'Sanjit Chand', 'Office Supplies', 'Binders', 9449.95, 4630.4755), 
('US-2012-163825', '6/16/2012', 'Lena Creighton', 'Office Supplies', 'Binders', 3050.376, 1143.891), 
('US-2014-135013', '7/25/2014', 'Harold Ryan', 'Technology', 'Copiers', 2399.96, 839.986), 
('CA-2012-111829', '3/19/2012', 'Fred Hopkins', 'Technology', 'Copiers', 3149.93, 1480.4671), 
('CA-2014-129021', '8/24/2014', 'Patrick Brill', 'Technology', 'Phones', 4367.896, 327.5922), 
('CA-2012-114811', '11/8/2012', 'Keith Dawkins', 'Technology', 'Machines', 4643.8, 2229.024), 
('CA-2013-143805', '12/2/2013', 'Jonathan Doherty', 'Office Supplies', 'Appliances', 2104.55, 694.5015), 
('CA-2012-145352', '3/16/2012', 'Christopher Martinez', 'Office Supplies', 'Binders', 6354.95, 3177.475), 
('CA-2014-138289', '1/17/2014', 'Andy Reiter', 'Office Supplies', 'Binders', 5443.96, 2504.2216), 
('CA-2014-118892', '8/18/2014', 'Tom Prescott', 'Furniture', 'Chairs', 4416.174, -630.882), 
('US-2012-163825', '6/16/2012', 'Lena Creighton', 'Office Supplies', 'Binders', 3050.376, 1143.891), 
('CA-2012-114811', '11/8/2012', 'Keith Dawkins', 'Technology', 'Machines', 4643.8, 2229.024)

---

USE SQL_START;

SELECT * FROM TBL_ORDER;


--Q1: List all orders in ascending or descending order of SALES.

SELECT *
FROM TBL_ORDER
ORDER BY SALES DESC

--Q2: List all customers in ascending order of CATEGORY and descending order by SALES. - multi level sorting
SELECT *
FROM TBL_ORDER
ORDER BY CATEGORY, SALES DESC;

-- DISTINCT is an expensive operation - Duplicacy removal + Sorting by all the columns

--Q3: Display only unique records from the order table.
SELECT DISTINCT *
FROM TBL_ORDER

--Q4: Display unique combination of CATEGORY and PRODUCT arranged in proper order.

SELECT DISTINCT CATEGORY, PRODUCT
FROM TBL_ORDER

--Q5: Which orders are giving loss to the company?
SELECT *
FROM TBL_ORDER
WHERE PROFIT < 0;

--Q6: Which are the orders that belong to Technology category?
SELECT *
FROM TBL_ORDER
WHERE CATEGORY = 'Technology';

-- BODMAS (Brackets off Division Multiplication Addition Substraction)

--Q7: Are there any orders from Technology, furniture category where products were sold at loss?

--Method 1
SELECT *
FROM TBL_ORDER
WHERE CATEGORY IN ('Technology','Furniture') AND PROFIT <0;

--Method 2
SELECT *
FROM TBL_ORDER
WHERE (CATEGORY = 'Technology' OR CATEGORY = 'Furniture' ) AND PROFIT <0;

--Q8: Which are the orders where Tables, Phones and Appliances are sold?

SELECT *
FROM TBL_ORDER
WHERE PRODUCT IN ('Tables', 'Phones', 'Appliances')

-- aren't

SELECT *
FROM TBL_ORDER
WHERE PRODUCT NOT IN ('Tables', 'Phones', 'Appliances');

--  Translate above query using single valued comparison and Logical operator

SELECT *
FROM TBL_ORDER
WHERE (PRODUCT = 'Tables' OR PRODUCT = 'Phones' OR PRODUCT = 'Appliances') ;


--Q9: List all orders excluding TBL_ORDER product. [subsetting]

SELECT REF_NO,ORD_DTE,SALES,CUST_NAME,PROFIT,CATEGORY
FROM TBL_ORDER;

--Q10: From which of the orders company has gained profit by selling Tables, Phones and Appliances?
SELECT *
FROM TBL_ORDER
WHERE PRODUCT IN ('Tables','Phones','Applicanes') and PROFIT >0;

-- Combining multiple conditions in brackets

SELECT *
FROM TBL_ORDER
WHERE (PRODUCT ='Tables'AND PROFIT > 0) OR (PRODUCT ='Phones'AND PROFIT = 0);


--Q10: From which of the orders company has gained profit by selling Tables, Phones and Appliances?
SELECT *
FROM TBL_ORDER
WHERE PRODUCT IN ('Tables','Phones','Applicanes') and PROFIT >0;

--Q11: List all order details where sales are between 3000 and 5000.
SELECT *
FROM TBL_ORDER
WHERE SALES BETWEEN 3000 AND 5000;

/*
Wild card operators - Will always be used along with LIKE operator
% - 0 or more characters
_ - one and only one character
[] - Range of characters 

*/


--Q12: List orders which are placed by customers where customer name starts with 

-- J 

SELECT *
FROM TBL_ORDER
WHERE CUST_NAME LIKE 'J%';

-- T 


SELECT *
FROM TBL_ORDER
WHERE CUST_NAME LIKE 'T%';

-- J or T

SELECT *
FROM TBL_ORDER
WHERE CUST_NAME LIKE '[JT]%';

--

SELECT *
FROM TBL_ORDER
WHERE CUST_NAME LIKE 'J%' OR CUST_NAME LIKE 'T%';

-- ends with d

SELECT * 
FROM TBL_ORDER
WHERE CUST_NAME LIKE '%D';

-- J or T and ends with d

SELECT *
FROM TBL_ORDER
WHERE CUST_NAME LIKE '[JT]%D';

--Q13: Orders where characters at 2nd and 3rd of cust_name positions are is 'ar'

SELECT *
FROM TBL_ORDER
WHERE CUST_NAME LIKE '_%ar%'


--Q14: Which are the Top 5 orders in terms of sales amount?

SELECT TOP 5 *
FROM TBL_ORDER
ORDER BY SALES DESC;

--Q15: Which are the bottom 25% orders in terms of profits?

SELECT TOP 25 PERCENT*
FROM TBL_ORDER
ORDER BY PROFIT;


--Q16: Display order details with appropiate header labels  - Alias Names
-- e.g. Customer Name, Product category and Sales amount etc..

SELECT
REF_NO AS REFERENCE_NUMBER,
ORD_DTE AS [ORDER DATE],
CUST_NAME AS CUSTOMER_NAME,
CATEGORY, PRODUCT,SALES,PROFIT
FROM TBL_ORDER


-- Odd case - distorted data

SELECT 
CATEGORY, PRODUCT
FROM TBL_ORDER;

/*
Functions in SQL:

Logical - CASE WHEN THEN
Aggregation - SUM, MIN, MAX, AVG, COUNT, VAR, STDDEV
Text - LEFT, RIGHT, MID|SUBSTR|SUBSTRING, UPPER, LOWER, PROPER|CAPITALIZE, LEN, STUFF, REPLACE, FIND, TRIM, RTRIM, LTRIM
DateTime - YEAR, MONTH, DAY, HOUR, MIN, SECOND, NOW|TODAY|GETDATE, GETDATEPART, GETDATENAME, DATE, DATEDIFF, DATEADD
Math - ROUND, FLOOR, CEIL|CEILING, POWER|POW, ABS
Data type conversion - CAST, CONVERT
Window Functions - 
	a. Aggregation Window Function - SUM, MIN, MAX, AVG, COUNT
	b. Ranking Window Function - ROW_NUMBER, DENSE_RANK, RANK
	c. Value Window Function - LAG, LEAD
*/

--Q17: Functions in SQL

-- Applications of Date/Time functions

--Q18: How many orders are placed for each category? Get the total sales amount as well.

SELECT CATEGORY,
COUNT(*) AS TOTAL_TRANSACTION,
SUM(SALES) AS TOTAL_SALES
FROM TBL_ORDER
GROUP BY CATEGORY;


--Q19: What is the monthly sales amount?

SELECT MONTH(ORD_DTE) AS MONTH_,
SUM(SALES) AS TOTAL_SALES
FROM TBL_ORDER
GROUP BY MONTH(ORD_DTE);


--Q20: Are there any customers with duplicate reference number?

SELECT REF_NO, COUNT(*) AS TOTAL_COUNT
FROM TBL_ORDER
GROUP BY REF_NO
HAVING COUNT(*) > 1;


---
/*What is count of customers buying perticular product in Technology and Furniture category 
   in year 2011 and 2012. */

SELECT REF_NO, COUNT(*) AS TOTAL_COUNT 
FROM TBL_ORDER
WHERE CATEGORY IN ('Technology','Furniture') AND YEAR(ORD_DTE) IN (2011,2012)
GROUP BY REF_NO


/*2. Get the maximum, minimum and average sales amount for each product along with customer 
   count.*/

SELECT
PRODUCT,
COUNT(*) AS CUSTOMER_COUNT,
MAX(SALES) AS MAX_SALES,
MIN(SALES) AS MIN_SALES,
AVG(SALES)AS AVG_SALES
FROM TBL_ORDER
GROUP BY PRODUCT;

--3. Display data for only those products which are bought by more than one customer.

SELECT
PRODUCT,
COUNT(*) AS CUSTOMER_COUNT,
MAX(SALES) AS MAX_SALES,
MIN(SALES) AS MIN_SALES,
AVG(SALES)AS AVG_SALES
FROM TBL_ORDER
GROUP BY PRODUCT
HAVING  COUNT(DISTINCT REF_NO) >1;

--Output should be arranged in descending order of customer count and average sales amount.

SELECT
    PRODUCT,
    COUNT(DISTINCT REF_NO) AS CUSTOMER_COUNT,
    MAX(SALES) AS MAX_SALES,
    MIN(SALES) AS MIN_SALES,
    AVG(SALES) AS AVG_SALES
FROM TBL_ORDER
GROUP BY PRODUCT
HAVING COUNT(DISTINCT REF_NO) > 1
ORDER BY CUSTOMER_COUNT DESC, AVG_SALES DESC;
