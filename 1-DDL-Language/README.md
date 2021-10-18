
2021-09-19 - Training Session
### DDL - Data Defenition Language

**CREATE TABLE** *Employee* (
   *Empno* NVARCHAR(10),
   *EmpName* NVARCHAR(155),
   *DOB* DATE,
   *Salary* NUMERIC(20,2),
   *MGR* NVARCHAR(10),
   *age* NUMERIC(3)
)


- **ALTER TABLE** *dbo.Employee*
 **ALTER COLUMN** *age* FLOAT

- **ALTER TABLE** *dbo.Employee*
 **ALTER COLUMN** *Salary* FLOAT

- **ALTER TABLE** *dbo.Employee*
 **ADD** *Designation* NVARCHAR(55)

- **ALTER TABLE** *dbo.Employee*
 **DROP COLUMN** *Designation*


- **DROP TABLE** *dummy*
