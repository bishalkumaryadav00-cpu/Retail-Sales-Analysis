# 🛍️ Retail Sales Analysis using PostgreSQL

## 📌 Project Overview

This project demonstrates my SQL skills by analyzing a retail sales dataset using **PostgreSQL**. It covers database creation, data cleaning, exploratory data analysis (EDA), and business-driven SQL queries to uncover meaningful insights from retail transactions.

The project highlights my understanding of SQL fundamentals, aggregate functions, window functions, Common Table Expressions (CTEs), subqueries, date/time functions, and analytical problem-solving techniques commonly used by Data Analysts. The project follows the common retail sales case study structure widely used in SQL learning and portfolio projects.

---

## 🎯 Project Objectives

* Create and manage a retail sales database.
* Import and clean retail sales data.
* Perform Exploratory Data Analysis (EDA).
* Analyze customer purchasing behavior.
* Generate business insights using SQL queries.
* Practice advanced PostgreSQL functions and analytical SQL.

---

## 🛠️ Tools & Technologies

* PostgreSQL
* pgAdmin 4
* SQL
* Git & GitHub
* Visual Studio Code

---

## 📂 Dataset Information

The dataset contains retail transaction records including:

| Column          | Description              |
| --------------- | ------------------------ |
| transactions_id | Unique transaction ID    |
| sale_date       | Date of sale             |
| sale_time       | Time of sale             |
| customer_id     | Customer ID              |
| gender          | Customer gender          |
| age             | Customer age             |
| category        | Product category         |
| quantity        | Quantity purchased       |
| price_per_unit  | Product price            |
| cogs            | Cost of Goods Sold       |
| total_sale      | Total transaction amount |

---

## 📊 SQL Concepts Used

* SELECT
* WHERE
* ORDER BY
* GROUP BY
* HAVING
* Aggregate Functions
* CASE WHEN
* JOINS
* Common Table Expressions (CTEs)
* Window Functions
* Date Functions
* Subqueries
* Ranking Functions
* ROUND()
* EXTRACT()
* TO_CHAR()

---

## 📈 Business Questions Solved

This project answers several real-world business questions, including:

* Total number of sales
* Total customers
* Product category analysis
* Monthly sales trends
* Best selling month
* Average customer age
* High-value transactions
* Top performing product categories
* Customer purchasing behavior
* Shift-wise sales analysis
* Revenue analysis
* Ranking products based on sales
* Running total using Window Functions

---

## 📌 Sample SQL Query

```sql
SELECT
    category,
    ROUND(SUM(total_sale),2) AS total_revenue
FROM retail_sales
GROUP BY category
ORDER BY total_revenue DESC;
```

---

## 📊 Key Insights

* Identified the highest revenue-generating product categories.
* Analyzed monthly sales performance.
* Found peak shopping periods.
* Studied customer demographics.
* Identified high-value transactions.
* Compared category-wise revenue.
* Measured customer purchasing trends.

---

## 📁 Repository Structure

```
Retail-Sales-Analysis
│
├── SQL_first_project.sql
├── README.md
└── Dataset (CSV)
```

---

## 🚀 How to Run

1. Clone the repository

```bash
git clone https://github.com/bishalkumaryadav00-cpu/Retail-Sales-Analysis.git
```

2. Create a PostgreSQL database.

3. Import the CSV dataset.

4. Execute the SQL script:

```
SQL_first_project.sql
```

5. Explore the query results.

---

## 📚 Skills Demonstrated

* Data Cleaning
* SQL Query Writing
* Data Analysis
* Business Intelligence
* PostgreSQL
* Window Functions
* CTEs
* Data Aggregation
* Problem Solving
* Analytical Thinking

---

## 🎯 Learning Outcomes

Through this project I improved my understanding of:

* PostgreSQL Database Management
* Writing optimized SQL queries
* Business data analysis
* SQL best practices
* Analytical thinking
* Portfolio project development using GitHub

----- you like this project, please consider giving it a ⭐ on GitHub. It motivates me to continue building more Data Analytics and SQL projects.

