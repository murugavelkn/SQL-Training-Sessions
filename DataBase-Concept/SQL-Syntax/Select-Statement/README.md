SQL SELECT
==========

The most commonly used SQL command is **SELECT statement**. It is used to query the database and retrieve selected data that follow the conditions we want.

In simple words, we can say that the select statement used to query or retrieve data from a table in the database.

Let's see the syntax of select statement.

```sh
SELECT expressions
FROM tables
WHERE conditions;
```
Here expression is the column that we want to retrieve.

Tables indicate the tables, we want to retrieve records from.

* * *

Optional clauses in SELECT statement
------------------------------------

There are some optional clauses in SELECT statement:

**\[WHERE Clause\]** : It specifies which rows to retrieve.

**\[GROUP BY Clause\]** : Groups rows that share a property so that the aggregate function can be applied to each group.

**\[HAVING Clause\]** : It selects among the groups defined by the GROUP BY clause.

**\[ORDER BY Clause\]** : It specifies an order in which to return the rows.

For example, let a database table: student_details;

| ID  | First_name | Last_name | Age | Subject | Hobby |
| --- | --- | --- | --- | --- | --- |
| 1   | Amar | Sharma | 20  | Maths | Cricket |
| 2   | Akbar | Khan | 22  | Biology | Football |
| 3   | Anthony | Milton | 25  | Commerce | Gambling |

From the above example, select the first name of all the students. To do so, query should be like this:

```sh
SELECT first\_name FROM student\_details;
```
Note: the SQL commands are not case sensitive. We can also write the above SELECT statement as:

```sh
SELECT first\_name from student\_details;
```
Now, you will get following data:


```sh
 Amar

 Akbar

 Anthony
```
We can also retrieve data from more than one column. For example, to select first name and last name of all the students, you need to write

```sh
SELECT first\_name, last\_name FROM student_details;
```
Now, you will get following data:


```sh
 Amar        Sharma

 Akbar       Khan

 Anthony     Milton
```
We can also use clauses like WHERE, GROUP BY, HAVING, ORDER BY with SELECT statement.

Here a point is notable that only SELECT and FROM statements are necessary in SQL SELECT statements. Other clauses like WHERE, GROUP BY, ORDER BY, HAVING may be optional.



SQL SELECT DISTINCT
-------------------
The **SQL DISTINCT** command is used with SELECT key word to retrieve only distinct or unique data.

In a table, there may be a chance to exist a duplicate value and sometimes we want to retrieve only unique values. In such scenarios, SQL SELECT DISTINCT statement is used.

> ![](https://static.javatpoint.com/images/note.png) *Note: SQL SELECT UNIQUE and SQL SELECT DISTINCT statements are same.*

Let's see the syntax of select distinct statement.

>**SELECT DISTINCT** *column_name ,column_name* <br/>
**FROM**  *table_name;*

Let's try to understand it by the table given below:

| Student_Name | Gender | Mobile_Number | HOME_TOWN |
| --- | --- | --- | --- |
| Rahul Ojha | Male | 7503896532 | Lucknow |
| Disha Rai | Female | 9270568893 | Varanasi |
| Sonoo Jaiswal | Male | 9990449935 | Lucknow |


Here is a table of students from where we want to retrieve distinct information For example: distinct home-town.

>**SELECT DISTINCT** *home_town*
**FROM** *students*

Now, it will return two rows.


| HOME_TOWN |
| --- |
| Lucknow |
| Varanasi |
