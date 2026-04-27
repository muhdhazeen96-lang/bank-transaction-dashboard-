use bank;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/transaction_data.csv'
INTO TABLE transaction_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@Transaction_ID, @Customer_ID, @Account_Type, @Total_Balance, @Transaction_Amount, @Investment_Amount, @Investment_Type, @Transaction_Date, @month, @year)
SET Transaction_ID = @Transaction_ID,
    Customer_ID = @Customer_ID,
    Account_Type = @Account_Type,
    Total_Balance = @Total_Balance,
    Transaction_Amount = @Transaction_Amount,
    Investment_Amount = @Investment_Amount,
    Investment_Type = @Investment_Type,
    Transaction_Date = STR_TO_DATE(@Transaction_Date, '%d-%m-%Y'),
    month = @month,
    year = @year;
    SELECT COUNT(*) FROM transaction_data;
   SELECT * FROM transaction_data LIMIT 10;
SELECT 
COUNT(*) AS total_rows,
MIN(Transaction_Date) AS start_date,
MAX(Transaction_Date) AS end_date
FROM transaction_data;    
SELECT 
SUM(Transaction_Amount) AS total_transaction,
SUM(Investment_Amount) AS total_investment
FROM transaction_data;

SELECT 
Account_Type,
COUNT(*) AS total_transactions,
SUM(Transaction_Amount) AS total_amount
FROM transaction_data
GROUP BY Account_Type;

SELECT 
Account_Type,
AVG(Transaction_Amount) AS avg_transaction
FROM transaction_data
GROUP BY Account_Type;

SELECT 
Account_Type,
AVG(Transaction_Amount) AS avg_transaction
FROM transaction_data
GROUP BY Account_Type
ORDER BY avg_transaction DESC;

SELECT 
year,
month,
SUM(Transaction_Amount) AS total_amount
FROM transaction_data
GROUP BY year, month
ORDER BY year, month;

SELECT 
Investment_Type,
COUNT(*) AS total_transactions,
SUM(Investment_Amount) AS total_investment
FROM transaction_data
GROUP BY Investment_Type
ORDER BY total_investment DESC;

SELECT 
Investment_Type,
AVG(Investment_Amount) AS avg_investment
FROM transaction_data
GROUP BY Investment_Type
ORDER BY avg_investment DESC;

SELECT 
Account_Type,
Investment_Type,
COUNT(*) AS total_transactions,
SUM(Investment_Amount) AS total_investment
FROM transaction_data
GROUP BY Account_Type, Investment_Type
ORDER BY Account_Type, total_investment DESC;

SELECT 
Account_Type,
Investment_Type,
SUM(Investment_Amount) AS total_investment
FROM transaction_data
GROUP BY Account_Type, Investment_Type
ORDER BY Account_Type, total_investment DESC;

USE bank;
SELECT COUNT(*) FROM transaction_data;
SELECT * FROM transaction_data LIMIT 10;

SELECT Account_Type, SUM(Transaction_Amount)
FROM transaction_data
GROUP BY Account_Type;

SELECT Investment_Type, SUM(Investment_Amount)
FROM transaction_data
GROUP BY Investment_Type;

SELECT year, month, SUM(Transaction_Amount)
FROM transaction_data
GROUP BY year, month
ORDER BY year, month;