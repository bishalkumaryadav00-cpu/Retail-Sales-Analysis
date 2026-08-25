CREATE DATABASE FST_PROJECT_ON_SALES;

CREATE TABLE COM_SALES (
	TRANSACTIONS_ID INT PRIMARY KEY,
	SALE_DATE DATE,
	SALE_TIME TIME,
	CUSTOMER_ID INT,
	GENDER VARCHAR(20),
	AGE INT,
	CATEGORY VARCHAR(20),
	QUANTITY INT,
	PRICE_PER_UNIT FLOAT,
	COGS FLOAT,
	TOTAL_SALE FLOAT
);

-- Checking Null Values:
SELECT
	*
FROM
	COM_SALES
WHERE
	TRANSACTIONS_ID IS NULL
	OR SALE_DATE IS NULL
	OR SALE_TIME IS NULL
	OR CUSTOMER_ID IS NULL
	OR GENDER IS NULL
	OR AGE IS NULL
	OR CATEGORY IS NULL
	OR QUANTITY IS NULL
	OR PRICE_PER_UNIT IS NULL
	OR COGS IS NULL
	OR TOTAL_SALE IS NULL;

-- Deleting Null Values:

DELETE FROM COM_SALES
WHERE
	TRANSACTIONS_ID IS NULL
	OR SALE_DATE IS NULL
	OR SALE_TIME IS NULL
	OR CUSTOMER_ID IS NULL
	OR GENDER IS NULL
	OR AGE IS NULL
	OR CATEGORY IS NULL
	OR QUANTITY IS NULL
	OR PRICE_PER_UNIT IS NULL
	OR COGS IS NULL
	OR TOTAL_SALE IS NULL;

-- Data Exploration:

-- How many sales we have?

SELECT
	COUNT(*)
FROM
	COM_SALES;
-- How many category we have?

SELECT
	COUNT(DISTINCT CATEGORY)
FROM
	COM_SALES;

-- DATA ANALYSIS AND BUSINESS KEY PROBLEMS AND ANSWERS:

Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05':

SELECT
	*
FROM
	COM_SALES
WHERE
	SALE_DATE = '2022-11-05';

Q.2 Write a SQL query to retrieve all transacations where the categroy is 'Clothing' and the quantity sold is more than and equals to 4 in the
month of Nov-2022:

SELECT
	*
FROM
	COM_SALES
WHERE
	CATEGORY = 'Clothing'
	AND QUANTITY >= 4
	AND TO_CHAR(SALE_DATE, 'YYYY-MM') = '2022-11';

Q.3 Writa a SQl query to calculate the total sales (total_sale) for each category:

SELECT
	CATEGORY,
	SUM(TOTAL_SALE) AS CATEGORY_SALES,
	COUNT(TRANSACTIONS_ID) AS NO_OF_CATEGORY
FROM
	COM_SALES
GROUP BY
	CATEGORY
ORDER BY
	CATEGORY_SALES DESC;


Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.

SELECT
	ROUND(AVG(AGE), 2) AS AVG_CUST_AGE
FROM
	COM_SALES
WHERE
	CATEGORY = 'Beauty';
	
Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.

SELECT
	*
FROM
	COM_SALES
WHERE
	TOTAL_SALE > 1000;

Q.6 write a SQL query to find the total number of transactions (transactions_id) made by each gender in each category: 

SELECT
	CATEGORY,
	GENDER,
	COUNT(TRANSACTIONS_ID) AS NUMBER_OF_TRANSACTIONS
FROM
	COM_SALES
GROUP BY
	CATEGORY,
	GENDER
ORDER BY
	NUMBER_OF_TRANSACTIONS DESC;
	
Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year: 
SELECT
	YEAR,
	MONTH,
	MONTHLY_AVERAGE
FROM
	(
		SELECT
			EXTRACT(
				YEAR
				FROM
					SALE_DATE
			) AS YEAR,
			EXTRACT(
				MONTH
				FROM
					SALE_DATE
			) AS MONTH,
			ROUND(AVG(TOTAL_SALE)::NUMERIC, 2) AS MONTHLY_AVERAGE,
			RANK() OVER (
				PARTITION BY
					EXTRACT(
						YEAR
						FROM
							SALE_DATE
					)
				ORDER BY
					AVG(TOTAL_SALE) DESC
			) AS RANK
		FROM
			COM_SALES
		GROUP BY
			YEAR,
			MONTH
		ORDER BY
			MONTHLY_AVERAGE DESC
	) AS A1
WHERE
	RANK = 1;
	

Q. 8 Write a SQl query to find the top 5 customers based on the highest total_sales:

SELECT
	CUSTOMER_ID,
	SUM(TOTAL_SALE) AS TOTAL_SALE
FROM
	COM_SALES
GROUP BY
	CUSTOMER_ID
ORDER BY
	TOTAL_SALE
LIMIT
	5;

Q.9 Write a SQL query to find the number of unique customers who purchased items from each category:

SELECT
	CATEGORY,
	COUNT(DISTINCT CUSTOMER_ID) AS CUSTOMER_COUNT
FROM
	COM_SALES
GROUP BY
	CATEGORY
ORDER BY
	CUSTOMER_COUNT DESC;

Q.10 Write a SQL query to create each shift and number of orders (Example Morning <= 12, Afternoon Between 12 & 17, Evening > 17)


WITH
	HOURLY_SALE AS (
		SELECT
			*,
			CASE
				WHEN EXTRACT(
					HOUR
					FROM
						SALE_TIME
				) <= 12 THEN 'Morning'
				WHEN EXTRACT(
					HOUR
					FROM
						SALE_TIME
				) BETWEEN 12 AND 17  THEN 'Afternoon'
				ELSE 'Evening'
			END AS EMPLOYEE_SHIFT
		FROM
			COM_SALES
	)
SELECT
	EMPLOYEE_SHIFT,
	COUNT(*) AS SALE_IN_HOUR
FROM
	HOURLY_SALE
GROUP BY
	EMPLOYEE_SHIFT
ORDER BY
	SALE_IN_HOUR;

-- END OF PROJECT:

	

	




	