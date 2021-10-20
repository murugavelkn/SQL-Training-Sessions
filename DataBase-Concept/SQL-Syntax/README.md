## SQL Syntax
==========

When you want to do some operations on the data in the database, then you must have to write the query in the predefined syntax of SQL.

The syntax of the structured query language is a unique set of rules and guidelines, which is not case-sensitive. Its Syntax is defined and maintained by the ISO and ANSI standards.

Following are some most important points about the SQL syntax which are to remember:

-   You can write the keywords of SQL in both uppercase and lowercase, but writing the SQL keywords in uppercase improves the readability of the SQL query.
-   SQL statements or syntax are dependent on text lines. We can place a single SQL statement on one or multiple text lines.
-   You can perform most of the action in a database with SQL statements.
-   SQL syntax depends on relational algebra and tuple relational calculus.

SQL Statement {.h2}
-------------

[SQL](https://www.javatpoint.com/sql-tutorial)

statements tell the database what operation you want to perform on the structured data and what information you would like to access from the database.

The statements of SQL are very simple and easy to use and understand. They are like plain English but with a particular syntax.

**Simple Example of SQL statement:**

[](#)

[](#)

[](#)

1.  SELECT "column\_name" FROM "table\_name";    

SELECT "column\_name" FROM "table\_name";

Each SQL statement begins with any of the SQL keywords and ends with the
semicolon (;). The semicolon is used in the SQL for separating the
multiple Sql statements which are going to execute in the same call. In
this SQL tutorial, we will use the semicolon (;) at the end of each SQL
query or statement.

Most Important SQL Commands and Statements {.h2}
------------------------------------------

1.  [Select Statement](https://www.javatpoint.com/sql-select)
2.  [Update Statement](https://www.javatpoint.com/sql-update)
3.  [Delete Statement](https://www.javatpoint.com/sql-delete)
4.  [Create Table
    Statement](https://www.javatpoint.com/sql-create-table)
5.  [Alter Table Statement](https://www.javatpoint.com/sql-alter-table)
6.  [Drop Table Statement](https://www.javatpoint.com/sql-drop-table)
7.  [Create Database
    Statement](https://www.javatpoint.com/sql-create-database)
8.  [Drop Database
    Statement](https://www.javatpoint.com/sql-drop-database)
9.  [Insert Into Statement](https://www.javatpoint.com/sql-insert)
10. [Truncate Table
    Statement](https://www.javatpoint.com/sql-truncate-table)
11. Describe Statement
12. [Distinct Clause](https://www.javatpoint.com/sql-select-distinct)
13. Commit Statement
14. Rollback Statement
15. Create Index Statement
16. Drop Index Statement
17. Use Statement

**Let's discuss each statement in short one by one with syntax and one
example:**

### 1. SELECT Statement {.h3}

This SQL statement reads the data from the SQL database and shows it as
the output to the database user.

**Syntax of SELECT Statement:**

[](#)

[](#)

[](#)

1.  SELECT column\_name1, column\_name2, .…, column\_nameN  
2.      [ FROM table\_name ]  
3.      [ WHERE condition ]  
4.      [ ORDER BY order\_column\_name1 [ ASC | DESC ], .... ];  

SELECT column\_name1, column\_name2, .…, column\_nameN [ FROM
table\_name ] [ WHERE condition ] [ ORDER BY order\_column\_name1 [ ASC
| DESC ], .... ];

**Example of SELECT Statement:**

[](#)

[](#)

[](#)

1.  SELECT Emp\_ID, First\_Name, Last\_Name, Salary, City  
2.  FROM Employee\_details  
3.  WHERE Salary = 100000  
4.  ORDER BY Last\_Name  

SELECT Emp\_ID, First\_Name, Last\_Name, Salary, City FROM
Employee\_details WHERE Salary = 100000 ORDER BY Last\_Name

This example shows the **Emp\_ID, First\_Name, Last\_Name, Salary, and
City** of those employees from the **Employee\_details** table whose
**Salary** is **100000**. The output shows all the specified details
according to the ascending alphabetical order of **Last\_Name**.

### 3. UPDATE Statement {.h3}

This SQL statement changes or modifies the stored data in the SQL
database.

**Syntax of UPDATE Statement:**

[](#)

[](#)

[](#)

1.  UPDATE table\_name  
2.  SET column\_name1 = new\_value\_1, column\_name2 = new\_value\_2, ...., column\_nameN = new\_value\_N  
3.  [ WHERE  CONDITION ];  

UPDATE table\_name SET column\_name1 = new\_value\_1, column\_name2 =
new\_value\_2, ...., column\_nameN = new\_value\_N [ WHERE CONDITION ];

**Example of UPDATE Statement:**

[](#)

[](#)

[](#)

1.  UPDATE Employee\_details  
2.  SET Salary = 100000  
3.  WHERE Emp\_ID = 10;  

UPDATE Employee\_details SET Salary = 100000 WHERE Emp\_ID = 10;

This example changes the **Salary** of those employees of the
**Employee\_detail**s table whose **Emp\_ID** is **10** in the table.

### 3. DELETE Statement {.h3}

This SQL statement deletes the stored data from the SQL database.

**Syntax of DELETE Statement:**

[](#)

[](#)

[](#)

1.  DELETE FROM table\_name  
2.  [ WHERE CONDITION ];  

DELETE FROM table\_name [ WHERE CONDITION ];

**Example of DELETE Statement:**

[](#)

[](#)

[](#)

1.  DELETE FROM Employee\_details  
2.  WHERE First\_Name = 'Sumit';  

DELETE FROM Employee\_details WHERE First\_Name = 'Sumit';

This example deletes the record of those employees from the
**Employee\_details** table whose **First\_Name** is **Sumit** in the
table.

### 4. CREATE TABLE Statement {.h3}

This SQL statement creates the new table in the SQL database.

**Syntax of CREATE TABLE Statement:**

[](#)

[](#)

[](#)

1.  CREATE TABLE table\_name  
2.  (  
3.  column\_name1 data\_type [column1 constraint(s)],  
4.  column\_name2 data\_type [column2 constraint(s)],  
5.  .....  
6.  .....,  
7.  column\_nameN data\_type [columnN constraint(s)],  
8.  PRIMARY KEY(one or more col)  
9.  );  

CREATE TABLE table\_name ( column\_name1 data\_type [column1
constraint(s)], column\_name2 data\_type [column2 constraint(s)], .....
....., column\_nameN data\_type [columnN constraint(s)], PRIMARY KEY(one
or more col) );

**Example of CREATE TABLE Statement:**

[](#)

[](#)

[](#)

1.  CREATE TABLE Employee\_details(  
2.        Emp\_Id NUMBER(4) NOT NULL,  
3.        First\_name VARCHAR(30),  
4.        Last\_name VARCHAR(30),  
5.        Salary Money,  
6.        City VARCHAR(30),  
7.        PRIMARY KEY (Emp\_Id)  
8.  );  

CREATE TABLE Employee\_details( Emp\_Id NUMBER(4) NOT NULL, First\_name
VARCHAR(30), Last\_name VARCHAR(30), Salary Money, City VARCHAR(30),
PRIMARY KEY (Emp\_Id) );

This example creates the table **Employee\_details** with five columns
or fields in the SQL database. The fields in the table are **Emp\_Id,
First\_Name, Last\_Name, Salary,** and **City**. The **Emp\_Id** column
in the table acts as a **primary key**, which means that the Emp\_Id
column cannot contain duplicate values and null values.

### 5. ALTER TABLE Statement {.h3}

This SQL statement adds, deletes, and modifies the columns of the table
in the SQL database.

**Syntax of ALTER TABLE Statement:**

[](#)

[](#)

[](#)

1.  ALTER TABLE table\_name ADD column\_name datatype[(size)];  

ALTER TABLE table\_name ADD column\_name datatype[(size)];

The above SQL alter statement adds the column with its datatype in the
existing database table.

[](#)

[](#)

[](#)

1.  ALTER TABLE table\_name MODIFY column\_name column\_datatype[(size)];  

ALTER TABLE table\_name MODIFY column\_name column\_datatype[(size)];

The above 'SQL alter statement' renames the old column name to the new
column name of the existing database table.

[](#)

[](#)

[](#)

1.  ALTER TABLE table\_name DROP COLUMN column\_name;  

ALTER TABLE table\_name DROP COLUMN column\_name;

The above SQL alter statement deletes the column of the existing
database table.

**Example of ALTER TABLE Statement:**

[](#)

[](#)

[](#)

1.  ALTER TABLE Employee\_details   
2.  ADD Designation VARCHAR(18);  

ALTER TABLE Employee\_details ADD Designation VARCHAR(18);

This example adds the new field whose name is **Designation** with size
**18** in the **Employee\_details** table of the SQL database.

### 6. DROP TABLE Statement {.h3}

This SQL statement deletes or removes the table and the structure,
views, permissions, and triggers associated with that table.

**Syntax of DROP TABLE Statement:**

[](#)

[](#)

[](#)

1.  DROP TABLE [ IF EXISTS ]  
2.  table\_name1, table\_name2, ……, table\_nameN;  

DROP TABLE [ IF EXISTS ] table\_name1, table\_name2, ……, table\_nameN;

The above syntax of the drop statement deletes specified tables
completely if they exist in the database.

**Example of DROP TABLE Statement:**

[](#)

[](#)

[](#)

1.  DROP TABLE Employee\_details;   

DROP TABLE Employee\_details;

This example drops the **Employee\_details** table if it exists in the
SQL database. This removes the complete information if available in the
table.

### 7. CREATE DATABASE Statement {.h3}

This SQL statement creates the new database in the database management
system.

**Syntax of CREATE DATABASE Statement:**

[](#)

[](#)

[](#)

1.  CREATE DATABASE database\_name;  

CREATE DATABASE database\_name;

**Example of CREATE DATABASE Statement:**

[](#)

[](#)

[](#)

1.  CREATE DATABASE Company;   

CREATE DATABASE Company;

The above example creates the company database in the system.

### 8. DROP DATABASE Statement {.h3}

This SQL statement deletes the existing database with all the data
tables and views from the database management system.

**Syntax of DROP DATABASE Statement:**

[](#)

[](#)

[](#)

1.  DROP DATABASE database\_name;  

DROP DATABASE database\_name;

**Example of DROP DATABASE Statement:**

[](#)

[](#)

[](#)

1.  DROP DATABASE Company;   

DROP DATABASE Company;

The above example deletes the company database from the system.

### 9. INSERT INTO Statement {.h3}

This SQL statement inserts the data or records in the existing table of
the SQL database. This statement can easily insert single and multiple
records in a single query statement.

**Syntax of insert a single record:**

[](#)

[](#)

[](#)

1.  INSERT INTO table\_name  
2.  (   
3.  column\_name1,   
4.  column\_name2, .…,   
5.  column\_nameN  
6.  )  
7.  VALUES   
8.  (value\_1,   
9.  value\_2, ..…,   
10. value\_N  
11. );  

INSERT INTO table\_name ( column\_name1, column\_name2, .…,
column\_nameN ) VALUES (value\_1, value\_2, ..…, value\_N );

**Example of insert a single record:**

[](#)

[](#)

[](#)

1.  INSERT INTO Employee\_details  
2.  (   
3.  Emp\_ID,   
4.  First\_name,  
5.  Last\_name,  
6.  Salary,  
7.  City  
8.  )  
9.  VALUES   
10. (101,   
11. Akhil,  
12. Sharma,  
13. 40000,  
14. Bangalore  
15. );  

INSERT INTO Employee\_details ( Emp\_ID, First\_name, Last\_name,
Salary, City ) VALUES (101, Akhil, Sharma, 40000, Bangalore );

This example inserts **101** in the first column, **Akhil** in the
second column, **Sharma** in the third column, **40000** in the fourth
column, and **Bangalore** in the last column of the table
**Employee\_details**.

**Syntax of inserting a multiple records in a single query:**

[](#)

[](#)

[](#)

1.  INSERT INTO table\_name  
2.  ( column\_name1, column\_name2, .…, column\_nameN)  
3.  VALUES (value\_1, value\_2, ..…, value\_N), (value\_1, value\_2, ..…, value\_N),….;  

INSERT INTO table\_name ( column\_name1, column\_name2, .…,
column\_nameN) VALUES (value\_1, value\_2, ..…, value\_N), (value\_1,
value\_2, ..…, value\_N),….;

**Example of inserting multiple records in a single query:**

[](#)

[](#)

[](#)

1.  INSERT INTO Employee\_details  
2.  ( Emp\_ID, First\_name, Last\_name, Salary, City )  
3.  VALUES (101, Amit, Gupta, 50000, Mumbai), (101,  John, Aggarwal, 45000, Calcutta), (101, Sidhu, Arora, 55000, Mumbai);  

INSERT INTO Employee\_details ( Emp\_ID, First\_name, Last\_name,
Salary, City ) VALUES (101, Amit, Gupta, 50000, Mumbai), (101, John,
Aggarwal, 45000, Calcutta), (101, Sidhu, Arora, 55000, Mumbai);

This example inserts the records of three employees in the
**Employee\_details** table in the single query statement.

### 10. TRUNCATE TABLE Statement {.h3}

This SQL statement deletes all the stored records from the table of the
SQL database.

**Syntax of TRUNCATE TABLE Statement:**

[](#)

[](#)

[](#)

1.  TRUNCATE TABLE table\_name;  

TRUNCATE TABLE table\_name;

**Example of TRUNCATE TABLE Statement:**

[](#)

[](#)

[](#)

1.  TRUNCATE TABLE Employee\_details;  

TRUNCATE TABLE Employee\_details;

This example deletes the record of all employees from the
Employee\_details table of the database.

### 11. DESCRIBE Statement {.h3}

This SQL statement tells something about the specified table or view in
the query.

**Syntax of DESCRIBE Statement:**

[](#)

[](#)

[](#)

1.  DESCRIBE table\_name | view\_name;  

DESCRIBE table\_name | view\_name;

**Example of DESCRIBE Statement:**

[](#)

[](#)

[](#)

1.  DESCRIBE Employee\_details;  

DESCRIBE Employee\_details;

This example explains the structure and other details about the
**Employee\_details** table.

### 12. DISTINCT Clause {.h3}

This SQL statement shows the distinct values from the specified columns
of the database table. This statement is used with the **SELECT**
keyword.

**Syntax of DISTINCT Clause:**

[](#)

[](#)

[](#)

1.  SELECT DISTINCT column\_name1, column\_name2, ...  
2.  FROM table\_name;  

SELECT DISTINCT column\_name1, column\_name2, ... FROM table\_name;

**Example of DISTINCT Clause:**

[](#)

[](#)

[](#)

1.  SELECT DISTINCT City, Salary  
2.  FROM Employee\_details;  

SELECT DISTINCT City, Salary FROM Employee\_details;

This example shows the distinct values of the **City** and **Salary**
column from the **Employee\_details** table.

### 13. COMMIT Statement {.h3}

This SQL statement saves the changes permanently, which are done in the
transaction of the SQL database.

**Syntax of COMMIT Statement:**

[](#)

[](#)

[](#)

1.  COMMIT  

COMMIT

**Example of COMMIT Statement:**

[](#)

[](#)

[](#)

1.  DELETE FROM Employee\_details  
2.  WHERE salary = 30000;  
3.  COMMIT;  

DELETE FROM Employee\_details WHERE salary = 30000; COMMIT;

This example deletes the records of those employees whose **Salary** is
**30000** and then saves the changes permanently in the database.

### 14. ROLLBACK Statement {.h3}

This SQL statement undo the transactions and operations which are not
yet saved to the SQL database.

**Syntax of ROLLBACK Statement:**

[](#)

[](#)

[](#)

1.  ROLLBACK  

ROLLBACK

**Example of ROLLBACK Statement:**

[](#)

[](#)

[](#)

1.  DELETE FROM Employee\_details  
2.  WHERE City = Mumbai;  
3.  ROLLBACK;  

DELETE FROM Employee\_details WHERE City = Mumbai; ROLLBACK;

This example deletes the records of those employees whose **City** is
**Mumbai** and then undo the changes in the database.

### 15. CREATE INDEX Statement {.h3}

This SQL statement creates the new index in the SQL database table.

**Syntax of CREATE INDEX Statement:**

[](#)

[](#)

[](#)

1.  CREATE INDEX index\_name  
2.  ON table\_name ( column\_name1, column\_name2, …, column\_nameN );  

CREATE INDEX index\_name ON table\_name ( column\_name1, column\_name2,
…, column\_nameN );

**Example of CREATE INDEX Statement:**

[](#)

[](#)

[](#)

1.  CREATE INDEX idx\_First\_Name  
2.  ON employee\_details (First\_Name);  

CREATE INDEX idx\_First\_Name ON employee\_details (First\_Name);

This example creates an index **idx\_First\_Name** on the
**First\_Name** column of the **Employee\_details** table.

### 16. DROP INDEX Statement {.h3}

This SQL statement deletes the existing index of the SQL database table.

**Syntax of DROP INDEX Statement:**

[](#)

[](#)

[](#)

1.  DROP INDEX index\_name;   

DROP INDEX index\_name;

**Example of DROP INDEX Statement:**

[](#)

[](#)

[](#)

1.  DROP INDEX idx\_First\_Name;   

DROP INDEX idx\_First\_Name;

This example deletes the index **idx\_First\_Name** from the SQL
database.

### 17. USE Statement {.h3}

This SQL statement selects the existing SQL database. Before performing
the operations on the database table, you have to select the database
from the multiple existing databases.

**Syntax of USE Statement:**

[](#)

[](#)

[](#)

1.  USE database\_name;  

USE database\_name;

**Example of USE DATABASE Statement:**

[](#)

[](#)

[](#)

1.  USE Company;   

USE Company;

This example uses the company database.
