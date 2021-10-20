## SQL Syntax


When you want to do some operations on the data in the database, then you must have to write the query in the predefined syntax of SQL.

The syntax of the structured query language is a unique set of rules and guidelines, which is not case-sensitive. Its Syntax is defined and maintained by the ISO and ANSI standards.

Following are some most important points about the SQL syntax which are to remember:

-   You can write the keywords of SQL in both uppercase and lowercase, but writing the SQL keywords in uppercase improves the readability of the SQL query.
-   SQL statements or syntax are dependent on text lines. We can place a single SQL statement on one or multiple text lines.
-   You can perform most of the action in a database with SQL statements.
-   SQL syntax depends on relational algebra and tuple relational calculus.

SQL Statement
-------------

[SQL](https://www.javatpoint.com/sql-tutorial)

statements tell the database what operation you want to perform on the structured data and what information you would like to access from the database.

The statements of SQL are very simple and easy to use and understand. They are like plain English but with a particular syntax.

**Simple Example of SQL statement:**



> **SELECT** "*column\_name*" **FROM** "*table\_name*";

Each SQL statement begins with any of the SQL keywords and ends with the
semicolon (;). The semicolon is used in the SQL for separating the
multiple SQL statements which are going to execute in the same call. In
this SQL tutorial, we will use the semicolon (;) at the end of each SQL
query or statement.

Most Important SQL Commands and Statements
------------------------------------------

**&emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &nbsp; 1.  Select Statement <br/>
&emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &nbsp; 2.  Update Statement <br/>
&emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &nbsp; 3.  Delete Statement <br/>
&emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &nbsp; 4.  Create Table Statement <br/>
&emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &nbsp; 5.  Alter Table Statement <br/>
&emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &nbsp; 6.  Drop Table Statement <br/>
&emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &nbsp; 7.  Create Database Statement <br/>
&emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &nbsp; 8.  Drop Database Statement <br/>
&emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &nbsp; 9.  Insert Into Statement <br/>
&emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; 10. Truncate Table Statement <br/>
&emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; 11. Describe Statement <br/>
&emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; 12. Distinct Clause <br/>
&emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; 13. Commit Statement <br/>
&emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; 14. Rollback Statement <br/>
&emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; 15. Create Index Statement <br/>
&emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; 16. Drop Index Statement <br/>
&emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; 17. Use Statement** <br/>

**Let's discuss each statement in short one by one with syntax and one
example:**

### 1. SELECT Statement

This SQL statement reads the data from the SQL database and shows it as
the output to the database user.

**Syntax of SELECT Statement:**

> **SELECT** *column\_name1*, *column\_name2*, .…, *column\_nameN* <br />
**[ FROM** *table\_name* **]**
<br /> **[ WHERE** *condition* **]<br /> [ ORDER BY** *order\_column\_name1* **[ ASC | DESC ], .... ]**;

**Example of SELECT Statement:**

> **SELECT** *Emp\_ID, First\_Name, Last\_Name, Salary, City* <br />**FROM
Employee\_details <br /> WHERE** *Salary = 100000* <br /> **ORDER BY** *Last\_Name*

This example shows the **Emp**\_**ID**, First\_Name, Last\_Name, Salary, and
City** of those employees from the **Employee\_details** table whose
**Salary** is **100000**. The output shows all the specified details
according to the ascending alphabetical order of **Last\_Name**.

### 3. UPDATE Statement

This SQL statement changes or modifies the stored data in the SQL
database.

**Syntax of UPDATE Statement:**

>**UPDATE** *table\_name* <br /> **SET** *column\_name1 = new\_value\_1, column\_name2 =
new\_value\_2, ...., column\_nameN = new\_value\_N* <br /> **[ WHERE** *CONDITION* **];**

**Example of UPDATE Statement:**

>**UPDATE** *Employee\_details* <br /> **SET** *Salary = 100000* <br /> **WHERE** *Emp\_ID = 10*;

This example changes the **Salary** of those employees of the
**Employee\_detail**s table whose **Emp\_ID** is **10** in the table.

### 3. DELETE Statement

This SQL statement deletes the stored data from the SQL database.

**Syntax of DELETE Statement:**

>**DELETE FROM** *table\_name* <br /> **[ WHERE CONDITION ];**

**Example of DELETE Statement:**

**DELETE FROM** *Employee\_details* <br /> **WHERE** *First\_Name = 'Sumit';*

This example deletes the record of those employees from the
**Employee\_details** table whose **First\_Name** is **Sumit** in the
table.

### 4. CREATE TABLE Statement

This SQL statement creates the new table in the SQL database.

**Syntax of CREATE TABLE Statement:**


>**CREATE TABLE** *table\_name* **(** <br />
    &emsp; &emsp;  *column\_name1 data\_type [column1 constraint(s)],<br />
    &emsp; &emsp;  column\_name2 data\_type [column2 constraint(s)],<br />
    &emsp; &emsp;  .....,<br />
    &emsp; &emsp; .....,<br />
    &emsp; &emsp;  column\_nameN data\_type [columnN constraint(s)],*<br />
    **PRIMARY KEY(** *one or more col* **) );**

**Example of CREATE TABLE Statement:**

>**CREATE TABLE** *Employee\_details* **(**<br />
    &emsp; &emsp;  *Emp\_Id NUMBER(4) NOT NULL,<br />
    &emsp; &emsp;  First\_name VARCHAR(30),<br />
    &emsp; &emsp;  Last\_name VARCHAR(30),<br />
    &emsp; &emsp;  Salary Money,<br />
    &emsp; &emsp;  City VARCHAR(30),*<br />
**PRIMARY KEY (** *Emp\_Id* **) );**

This example creates the table **Employee\_details** with five columns
or fields in the SQL database. The fields in the table are **Emp\_Id,
First\_Name, Last\_Name, Salary,** and **City**. The **Emp\_Id** column
in the table acts as a **primary key**, which means that the Emp\_Id
column cannot contain duplicate values and null values.

### 5. ALTER TABLE Statement

This SQL statement adds, deletes, and modifies the columns of the table
in the SQL database.

**Syntax of ALTER TABLE Statement:**


> **ALTER TABLE** *table\_name* <br /> **ADD** *column\_name datatype[(size)];*

The above SQL alter statement adds the column with its datatype in the
existing database table.

> **ALTER TABLE** *table\_name* <br /> **MODIFY** *column\_name column\_datatype[(size)];*

The above 'SQL alter statement' renames the old column name to the new
column name of the existing database table.

>**ALTER TABLE** *table\_name* <br /> **DROP COLUMN** *column\_name;*

The above SQL alter statement deletes the column of the existing
database table.

**Example of ALTER TABLE Statement:**


>**ALTER TABLE** *Employee\_details* <br /> **ADD** *Designation VARCHAR(18);*

This example adds the new field whose name is **Designation** with size
**18** in the **Employee\_details** table of the SQL database.

### 6. DROP TABLE Statement

This SQL statement deletes or removes the table and the structure,
views, permissions, and triggers associated with that table.

**Syntax of DROP TABLE Statement:**

>**DROP TABLE** *[ IF EXISTS ]* <br /> *table\_name1, table\_name2, ……, table\_nameN;*

The above syntax of the drop statement deletes specified tables
completely if they exist in the database.

**Example of DROP TABLE Statement:**

>**DROP TABLE** *Employee\_details;*

This example drops the **Employee\_details** table if it exists in the
SQL database. This removes the complete information if available in the
table.

### 7. CREATE DATABASE Statement

This SQL statement creates the new database in the database management
system.

**Syntax of CREATE DATABASE Statement:**


>**CREATE DATABASE** *database\_name;*

**Example of CREATE DATABASE Statement:**

>**CREATE DATABASE** *Company;*

The above example creates the company database in the system.

### 8. DROP DATABASE Statement

This SQL statement deletes the existing database with all the data
tables and views from the database management system.

**Syntax of DROP DATABASE Statement:**

>**DROP DATABASE** *database\_name;*

**Example of DROP DATABASE Statement:**

>**DROP DATABASE** *Company;*

The above example deletes the company database from the system.

### 9. INSERT INTO Statement

This SQL statement inserts the data or records in the existing table of
the SQL database. This statement can easily insert single and multiple
records in a single query statement.

**Syntax of insert a single record:**

>**INSERT INTO** *table\_name* <br /> **(**&emsp; &emsp;*column\_name1, <br /> &emsp; &emsp; column\_name2, <br /> &emsp; &emsp; .…, <br />
&emsp; &emsp; column\_nameN* <br /> **) <br /> VALUES <br />(**&emsp; &emsp;*value\_1, <br /> &emsp; &emsp; value\_2, <br /> &emsp; &emsp; ..…, <br /> &emsp; &emsp; value\_N <br />* **);**

**Example of insert a single record:**

>**INSERT INTO** *Employee\_details* <br /> **(** &emsp; &emsp; *Emp\_ID, <br /> &emsp; &emsp; First\_name, <br /> &emsp; &emsp; Last\_name, <br />
&emsp; &emsp; Salary, <br /> &emsp; &emsp; City* <br /> **) <br /> VALUES <br /> (** <br /> &emsp; &emsp; *101, <br /> &emsp; &emsp; Akhil, <br /> &emsp; &emsp; Sharma, <br /> &emsp; &emsp; 40000, <br /> &emsp; &emsp; Bangalore* <br /> **);**

This example inserts **101** in the first column, **Akhil** in the
second column, **Sharma** in the third column, **40000** in the fourth
column, and **Bangalore** in the last column of the table
**Employee\_details**.

**Syntax of inserting a multiple records in a single query:**

>**INSERT INTO** *table\_name* <br /> **(** *column\_name1, column\_name2, .…,
column\_nameN* **) <br /> VALUES (** *value\_1, value\_2, ..…, value\_N* **), (** *value\_1,
value\_2, ..…, value\_N* **)**,*….;*

**Example of inserting multiple records in a single query:**

>**INSERT INTO** *Employee\_details* <br /> **(** *Emp\_ID, First\_name, Last\_name,
Salary, City* **) <br /> VALUES (** *101, Amit, Gupta, 50000, Mumbai* **), (** *101, John,
Aggarwal, 45000, Calcutta* **), (** *101, Sidhu, Arora, 55000, Mumbai* **);**

This example inserts the records of three employees in the
**Employee\_details** table in the single query statement.

### 10. TRUNCATE TABLE Statement {.h3}

This SQL statement deletes all the stored records from the table of the
SQL database.

**Syntax of TRUNCATE TABLE Statement:**

>**TRUNCATE TABLE** *table\_name;*

**Example of TRUNCATE TABLE Statement:**

>**TRUNCATE TABLE** *Employee\_details;*

This example deletes the record of all employees from the
Employee\_details table of the database.

### 11. DESCRIBE Statement

This SQL statement tells something about the specified table or view in
the query.

**Syntax of DESCRIBE Statement:**

>**DESCRIBE** *table\_name | view\_name;*

**Example of DESCRIBE Statement:**

>**DESCRIBE** *Employee\_details;*

This example explains the structure and other details about the
**Employee\_details** table.

### 12. DISTINCT Clause

This SQL statement shows the distinct values from the specified columns
of the database table. This statement is used with the **SELECT**
keyword.

**Syntax of DISTINCT Clause:**

>**SELECT DISTINCT** *column\_name1, column\_name2, ..., column\_nameN* <br /> **FROM** *table\_name;*

**Example of DISTINCT Clause:**

>**SELECT DISTINCT** *City, Salary* <br /> **FROM** *Employee\_details;*

This example shows the distinct values of the **City** and **Salary**
column from the **Employee\_details** table.

### 13. COMMIT Statement

This SQL statement saves the changes permanently, which are done in the
transaction of the SQL database.

**Syntax of COMMIT Statement:**

>**COMMIT**

**Example of COMMIT Statement:**

>**DELETE FROM** *Employee\_details* <br/> **WHERE** *salary = 30000;* <br/> <br/> **COMMIT;**

This example deletes the records of those employees whose **Salary** is
**30000** and then saves the changes permanently in the database.

### 14. ROLLBACK Statement

This SQL statement undo the transactions and operations which are not
yet saved to the SQL database.

>**ROLLBACK**

**Example of ROLLBACK Statement:**

>**DELETE FROM** *Employee\_details* <br/> **WHERE** *City = Mumbai;* <br/> <br/> **ROLLBACK;**

This example deletes the records of those employees whose **City** is
**Mumbai** and then undo the changes in the database.

### 15. CREATE INDEX Statement

This SQL statement creates the new index in the SQL database table.

**Syntax of CREATE INDEX Statement:**

>**CREATE INDEX** *index\_name* <br/> **ON** *table\_name* **(** *column\_name1, column\_name2,
…, column\_nameN* **);**

**Example of CREATE INDEX Statement:**

>**CREATE INDEX** *idx\_First\_Name* <br /> **ON** *employee\_details (First\_Name);*

This example creates an index **idx\_First\_Name** on the
**First\_Name** column of the **Employee\_details** table.

### 16. DROP INDEX Statement {.h3}

This SQL statement deletes the existing index of the SQL database table.

**Syntax of DROP INDEX Statement:**

>**DROP INDEX** *index\_name;*

**Example of DROP INDEX Statement:**

>**DROP INDEX** *idx\_First\_Name;*

This example deletes the index **idx\_First\_Name** from the SQL
database.

### 17. USE Statement {.h3}

This SQL statement selects the existing SQL database. Before performing
the operations on the database table, you have to select the database
from the multiple existing databases.

**Syntax of USE Statement:**

>**USE** *database\_name;*

**Example of USE DATABASE Statement:**

>**USE** *Company;*

This example uses the company database.
