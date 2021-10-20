* * *

SQL SELECT COUNT
================

The **SQL COUNT()** is a function that returns the number of records of the table in the output.

This function is used with the SQL SELECT statement.

**Let's take a simple example:** If you have a record of the voters in the selected area and want to count the number of voters, then it is very difficult to do it manually, but you can do it easily by using SQL SELECT COUNT query.

Syntax of Select Count Function in SQL
--------------------------------------
>**SELECT COUNT** *(column\_name)* <br/> **FROM** *table\_name;*

In the syntax, we have to specify the column's name after the COUNT keyword and the name of the table on which the Count function is to be executed.

Examples of Select Count Function in SQL
----------------------------------------

In this article, we have taken the following two SQL examples that will help you to run the Count function in the query:

**Example 1:** In this example, we have a table called **Bike** with three columns:

| Bike_Name | Bike_Color | Bike_Cost |
| --- | --- | --- |
| Pulsar | Black | 185,000 |
| Apache | Black | NULL |
| KTM RC | Red | 90,0000 |
| Royal Enfield | White | NULL |
| Livo | Black | 80,000 |
| KTM DUKE | Red | 195,000 |

* Suppose, you want to count the total number of bike colors from **Bike** Table. For this operation, you have to write the following SQL statement:

>**SELECT COUNT** *(Bike_Color)* **AS** *TotalBikeColor* <br/> **FROM** *Bikes;*

This query will show the following output on the screen:

| TotalBikeColor |
| --- |
| 6   |

The output of this query is six because the **Bike_Color** column does not contain any NULL value.

* Suppose, you want to count the total values of **the Bike_Cost** column from the above **Bike** Table. For this operation, you have to write the following statement in SQL:

>**SELECT COUNT** *(Bike_Cost)* **AS** *TotalBikeCost* <br/> **FROM** *Bikes;*

This query will show the following output on the screen:

| TotalBikeCost |
| --- |
| 4   |

The output of this query is four because two values of the Bike_Cost column are NULL and, these two NULL values are excluded from the count function. That's why this query shows four instead of 6 in the output.

**Example 2:** In this example, we have an **Employee_details** table with four columns:

| Emp_Id | Emp_Name | Emp_Salary | Emp_City |
| --- | --- | --- | --- |
| 2001 | Saurabh | 25000 | NULL |
| 2002 | Ram | 29000 | Delhi |
| 2003 | Sumit | 30000 | NULL |
| 2004 | Ankit | 45000 | Goa |
| 2005 | Bheem | 40000 | NULL |

* Suppose, you want to count the total values of **the Emp_City** column of the above **Employee_details** table. For this query, you have to write the following statement in Structured Query Language:

>**SELECT COUNT** *(Emp\_City)* **AS** *TotalCity* <br/> **FROM** *Employee\_details ;*

This query will show the following output on the screen:

| TotalCity |
| --- |
| 2   |

The output of this query is two because the three values of the **Emp_City** column are NULL. And, these three NULL values are excluded from the count function. That's why this query shows two instead of 5 in the output.

Select Count(*) Function in SQL
-------------------------------

The count(*) function in SQL shows all the Null and Non-Null records present in the table.

### Syntax of Count (*) Function in SQL

>**SELECT COUNT(*) <br/> FROM** *table_name;*

### Example of Count (*) Function in SQL

In this example, we have the following **Bike** table with three columns:

| Bike_Name | Bike_Color | Bike_Cost |
| --- | --- | --- |
| Livo | Black | 185,000 |
| Apache | Red | NULL |
| Pulsar | Red | 90,0000 |
| Royal Enfield | Black | NULL |
| KTM DUKE | Black | 80,000 |
| KTM RC | White | 195,000 |

* Suppose, you want to count the total number of records from the **Bike** Table. For this condition, you have to write the following statement in Structured Query Language:

>**SELECT COUNT (*)** <br/. **FROM** *Bikes ;*

This query will show the following output on the screen:

| Count(*) |
| --- |
| 6   |

SQL Count() Function With WHERE Clause
--------------------------------------

We can also use the Count() function with the WHERE clause. The Count Function with WHERE clause in the SELECT statement shows those records that matched the specified criteria.

### Syntax of Count() Function With WHERE clause in SQL

>**SELECT COUNT**(*column\_name*) **FROM** *table\_name* **WHERE** *\[condition\];*

### Examples of Count Function With WHERE clause in SQL

The following two examples will help you to run the Count function with the WHERE clause in the SQL query:

**Example 1:** In this example, we have the following **Bike** table with three columns:

| Bike_Name | Bike_Color | Bike_Cost |
| --- | --- | --- |
| Apache | Black | 90,0000 |
| Livo | Black | NULL |
| KTM RC | Red | 185,000 |
| KTM DUKE | White | NULL |
| Royal Enfield | Red | 80,000 |
| Pulsar | Black | 195,000 |

* Suppose, you want to count the total number of bikes whose color is black. For this, you have to type the following statement in SQL:

>**SELECT COUNT** *(Bike\_Name)* **AS** *TotalBikeBlackColor* <br/> **FROM** *Bikes* <br/>**WHERE** *Bike\_Color = 'Black';*

This query will show the following output on the screen:

| TotalBikeBlackColor |
| --- |
| 3   |

**Example 2:** In this example, we have an **Employee_details** table with four columns:

| Emp_Id | Emp_Name | Emp_Salary | Emp_City |
| --- | --- | --- | --- |
| 2001 | Bheem | 30000 | Jaipur |
| 2002 | Ankit | 45000 | Delhi |
| 2003 | Sumit | 40000 | Delhi |
| 2004 | Ram | 29000 | Goa |
| 2005 | Abhay | 25000 | Delhi |

* Suppose, you want to count the total number of those employees who belong to Delhi city. For this, you have to write the following SQL statement:

>**SELECT COUNT** *(Emp\_Name)* **AS** *TotalEmpCity* <br/>**FROM** *Employee\_details* **WHERE** *Emp_City = 'Delhi';*

This query will show the following output on the screen:

| TotalEmpCity |
| --- |
| 3   |

SQL Count Function With DISTINCT keyword
----------------------------------------

The DISTINCT keyword with the COUNT function shows only the numbers of unique rows of a column.

### Syntax of Count Function With DISTINCT keyword in SQL

>**SELECT COUNT** *(* **DISTINCT** *column\_name)* <br/> **FROM** *table\_name* <br/>**WHERE** *\[condition\];*

### Examples of Count Function With DISTINCT keyword in SQL

The following two examples will help you how to run the Count function with the DISTINCT keyword in the SQL query:

**Example 1:**

In this example, we have taken the following **Cars** table with three columns:

| Car_Name | Car_Color | Car_Cost |
| --- | --- | --- |
| i20 | White | 10,85,000 |
| Hyundai Venue | Black | 9,50,000 |
| Swift Dezire | Red | 9,00,000 |
| Hyundai Creta | White | 7,95,000 |
| Kia Seltos | White | 8,00,000 |
| Kia Sonet | Red | 10,00,000 |

* Suppose, you want to count the unique colors of a car from the above table. For this query, you have to write the below statement in SQL:

>**SELECT COUNT** *(* **DISTINCT** *Car\_Color)* **AS** *Unique\_Car_Color* <br/>**FROM** *Cars ;*

This query will show the following output on the screen:

| Unique\_Car\_Color |
| --- |
| 3   |

The output of this query is three because there are three unique values of the car.

**Example 2:**

In this example, we have taken an **Employee** table with four columns:

| Emp_Id | Emp_Name | Emp_Salary | Emp_City |
| --- | --- | --- | --- |
| 2001 | Sumit | 25000 | Jaipur |
| 2002 | Ram | 45000 | Delhi |
| 2003 | Bheem | 25000 | Delhi |
| 2004 | Ankit | 29000 | Goa |
| 2005 | Abhay | 40000 | Delhi |

* Suppose, you want to count the unique values of the **Emp_Salary**field from the Employee_details table. For this, you have to write the following statement in Structured Query Language:

>**SELECT COUNT** *(* **DISTINCT** *Emp\_Salary)* **AS** *Unique\_Salary* <br/> **FROM** *Employee ;*

This query will show the following output on the screen:

| Unique_Salary |
| --- |
| 4   |
