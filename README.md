# Relational Database Concept for Beginners - A Curriculum


### Meet the Team

Dr. Murugavel.KN


### Pedagogy

>This course developed for the Training Session for who are all know about SQL basic. The course and the example Exercise are built based on live streaming data. This course may helpful to anyone to know the syntax of the commands and the query examples to build their required task queries to bring outputs using this.

>In addition, this is not for only SQL Serve, this may give knowledge for MySQL, Access, ORACLE Database concepts. The basic syntax is the same for all but in some special cases may have some changes in query writings.



### DBMS Tutorial
>DBMS Tutorial provides basic and advanced concepts of Database. Our DBMS Tutorial is designed for beginners and professionals both.

Database management system is software that is used to manage the [database](DataBase-Concept/What-is-Database/README.md).

- Our DBMS Tutorial includes all topics of DBMS such as introduction, ER model, keys, relational model, join operation, SQL, functional dependency, transaction, concurrency control, etc.

#### What is Database?
The database is a collection of inter-related data which is used to retrieve, insert and delete the data efficiently. It is also used to organize the data in the form of a table, schema, views, and reports, etc.
**For example:** The college Database organizes the data about the admin, staff, students and faculty etc.

Using the database, you can easily retrieve, insert, and delete the information.

## Database Management System
- Database management system is a software which is used to manage the database. For example: MySQL, Oracle,..etc are a very popular commercial database which is used in different applications.
- DBMS provides an interface to perform various operations like database creation, storing data in it, updating data, creating a table in the database and a lot more.
- It provides protection and security to the database. In the case of multiple users, it also maintains data consistency.

###### DBMS allows users the following tasks:

- **Data Definition:** It is used for creation, modification, and removal of definition that defines the organization of data in the database.
- **Data Updation:** It is used for the insertion, modification, and deletion of the actual data in the database.
- **Data Retrieval:** It is used to retrieve the data from the database which can be used by applications for various purposes.
- **User Administration:** It is used for registering and monitoring users, maintain data integrity, enforcing data security, dealing with concurrency control, monitoring performance and recovering information corrupted by unexpected failure.

## Characteristics of DBMS
- It uses a digital repository established on a server to store and manage the information.
- It can provide a clear and logical view of the process that manipulates data.
- DBMS contains automatic backup and recovery procedures.
- It contains ACID properties which maintain data in a healthy state in case of failure.
- It can reduce the complex relationship between data.
- It is used to support manipulation and processing of data.
- It is used to provide security of data.
- It can view the database from different viewpoints according to the requirements of the user.

## Advantages of DBMS
- **Controls database redundancy:** It can control data redundancy because it stores all the data in one single database file and that recorded data is placed in the database.
- **Data sharing:** In DBMS, the authorized users of an organization can share the data among multiple users.
- **Easily Maintenance:** It can be easily maintainable due to the centralized nature of the database system.
- **Reduce time:** It reduces development time and maintenance need.
- **Backup:** It provides backup and recovery subsystems which create automatic backup of data from hardware and software failures and restores the data if required.
- **Multiple user interface:** It provides different types of user interfaces like graphical user interfaces, application program interfaces
## Disadvantages of DBMS
- **Cost of Hardware and Software:** It requires a high speed of data processor and large memory size to run DBMS software.
- **Size:** It occupies a large space of disks and large memory to run them efficiently.
- **Complexity:** Database system creates additional complexity and requirements.
- **Higher impact of failure:** Failure is highly impacted the database because in most of the organization, all the data stored in a single database and if the database is damaged due to electric failure or database corruption then the data may be lost forever.





### Lesson includes:

- [SQL Query concepts](DataBase-Concept/SQL-Tutorial/README.md)   
- DDL - Data Definition Language
- DML - Data Manipulation Language <br/>
- [DQL - Data Query Language](3-DQL-Language/README.md) <br/>
&emsp; &emsp;  [1. SQL syntax](DataBase-Concept/SQL-Syntax/README.md) <br/>
&emsp; &emsp;  [2. Select Statement](DataBase-Concept/SQL-Syntax/Select-Statement/README.md) <br/>
&emsp; &emsp;  [3. Select Count Statement](DataBase-Concept/SQL-Syntax/SQL-Select-Count/README.md) <br/>
&emsp; &emsp;  [5. Calculating Subtotal in SQL](3-DQL-Language/03-5-Calculate-Subtotal/README.md) <br/>
- Views
- Stored Procedure
- Scalar Functions
- Triggers
- Assignment
- Post-lesson quiz

### Table of content

| Lesson Number | Topic | Learning Objectives | Linked Lesson |
| :-----: | :------- |  :-------------------- | :---- |
| 01 | DDL - Data Definition Language | Learn the concepts to create, alter, drop the table by defining the data models, altering the models using the data dictionary. | - [Lesson](1-DDL-Language/README.md) <br /> - [SQL](1-DDL-Language/DDL-Query.sql)|
| 02 | DML - Data Manipulation Language | Learn the concepts to Insert, Update and Delete from the table content. | [lesson](2-DML-Language/README.md) |
| 03 | DQL - Data Query Language | Learn the concepts to write query called 'SELECT Statements' according to required information from the table data. | [Lesson](3-DQL-Language/README.md) |
|    | 03.1 | Simple Queries. | - [Lesson](3-DQL-Language/03-1-Simple-Query/README.md)<br /> - [SQL](3-DQL-Language/03-1-Simple-Query/simple-query.sql) |
|    | 03.2 | ORDER BY Clause. | - [Lesson](3-DQL-Language/03-2-Order-By/README.md) <br /> - [SQL](3-DQL-Language/03-2-Order-By/Order-By.sql) |
|    | 03.3 | GROUP BY Clause. | - [Lesson](3-DQL-Language/03-3-GROUP-BY/README.md) <br /> - [SQL](3-DQL-Language/03-3-Group-By/Group-By.sql) |
|    | 03.4 | HAVING Clause. | - [Lesson](3-DQL-Language/03-4-Having-Clause/README.md) <br /> - [SQL](3-DQL-Language/03-4-Having-Clause/Having-Clause.sql) |
| I. | Task | Working Exercise Task-001. | [Task-001](Task/Task001.txt) <br /> [Solution](Task/Solutions/Task001-Solution.sql) |
