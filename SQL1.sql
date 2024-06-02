-- SQL Basics
/* 
  */

--SQL Hardcore Practice 

--Create new Database 

CREATE DATABASE SQL_START
GO

--Use Database DSA
USE SQL_START

--Drop database
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

--Alter Table
ALTER TABLE Employee 
ADD GENDER CHAR(1)



