--SQL Hardcore Practice 

--Create new Database 

CREATE DATABASE SQL_START
GO

--Use Database DSA
USE SQL_START

--Drop database - Drops data and structure 
DROP DATABASE DSA

--DUMMY TABLE 
CREATE TABLE Employee(
EMP_ID INT IDENTITY(1241,3)PRIMARY KEY,
First_NAME VARCHAR(50) NOT NULL,
LastName VARCHAR(80) NOT NULL,
POSTCODE INT,
PHONE_NUM INT DEFAULT '999999999'
)

--Selecting from employee 
SELECT * 
FROM Employee

--Alter Table Employee
ALTER TABLE EMPLOYEE
ADD Gender char(1)

ALTER TABLE EMPLOYEE
ALTER COLUMN GENDER VARCHAR(6)

ALTER TABLE EMPLOYEE 
DROP COLUMN Gender

--Inserting data 
--Method 1

INSERT INTO EMPLOYEE VALUES
('Priya','Chhabra',110059,1234567890)

--Method 2
INSERT INTO Employee(LastName,First_NAME,PHONE_NUM,POSTCODE) VALUES
('Smith','Rebecca',987456321,110089)

--Updating Values 

--Method 1 Where clause
UPDATE Employee
SET 
PHONE_NUM = 829371646
WHERE
EMP_ID = 1241

--Method 2 --As there is no clause all rows got affected with changes
UPDATE Employee
SET
PHONE_NUM = 111111111

