# Corper Analytics Workshop 5.0 — SQL Server Training

## About the Project

This repository contains SQL Server training materials prepared for **Corper Analytics Workshop 5.0**. It is designed to help beginners develop practical SQL skills through hands-on exercises, query examples, and a PowerPoint presentation.

The training focuses on retrieving, combining, ranking, and analyzing data using SQL Server.

## Topics Covered

### 1. SQL JOINs
- `INNER JOIN`
- `LEFT JOIN`
- `RIGHT JOIN`
- `FULL OUTER JOIN`

Learn how to combine records from multiple tables and understand how each join handles matching and non-matching records.

### 2. SQL Set Operators
- `UNION` — combines query results and removes duplicates.
- `UNION ALL` — combines query results while retaining duplicates.
- `INTERSECT` — returns distinct rows common to both query results.

### 3. SQL Window Functions

**Ranking Functions**
- `ROW_NUMBER()`
- `RANK()`
- `DENSE_RANK()`
- `NTILE()`

**Window Aggregate Functions**
- `SUM()`
- `AVG()`
- `MIN()`
- `MAX()`
- `COUNT()`

**Value Functions**
- `FIRST_VALUE()`
- `LAST_VALUE()`
- `NTH_VALUE()`

**Distribution Functions**
- `PERCENT_RANK()`
- `CUME_DIST()`

## Learning Objectives

By working through the materials, learners will be able to:

- Combine data from multiple tables using SQL JOINs.
- Understand the differences between SQL set operators.
- Rank records and divide data into groups.
- Calculate running totals, averages, and other window-based metrics.
- Retrieve first, last, and specific values from ordered datasets.
- Calculate percentile ranks and cumulative distributions.
- Apply SQL techniques to practical data analysis scenarios.

## Repository Contents

| File | Description |
|---|---|
| `CorperAnalyticsWorkshop-5.0.pptx` | PowerPoint presentation for the workshop. |
| `SQL Joins-Union-UnionAll-Intersection.sql` | Practical SQL queries for JOINs and set operators. |
| `SQL_Window_Functions.sql` | Practical SQL exercises and solutions for window functions. |

## Tools Required

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)

## How to Use

1. Clone or download this repository.
2. Open the relevant `.sql` file in SQL Server Management Studio.
3. Execute the setup script to create the sample tables and insert the data, if included.
4. Run the queries and examine the results.
5. Attempt the practice questions before checking the solutions.
6. Refer to the PowerPoint presentation for additional explanations.

## Who Is This For?

- Corps members and SQL beginners
- Aspiring data analysts and data engineers
- Business intelligence professionals
- Students preparing for SQL interviews
- Anyone interested in developing practical SQL skills

## Acknowledgement

Created as part of the learning resources for Corper Analytics Workshop 5.0, with a focus on making SQL concepts accessible through practical examples and hands-on exercises.

**Happy Learning!**
