# Day 6 Code Wave Database Tasks

This repository contains SQL tasks related to stored procedures and triggers. Each task is detailed below with code and usage examples.

---

## Task 1: Procedure to Count Students per Department

### Description
This procedure calculates the number of students in each department by joining the `Student` and `Department` tables.

### Code
```sql
create procedure StudNum as
Begin
	select count(St_Id) as "student count",Dept_Name
	from Student
	inner join Department on Student.Dept_Id=Department.Dept_Id
	group by Dept_Name
End;

exec StudNum
```
## Task 2: Procedure to Calculate the Area of a Circle

### Description
This procedure calculates the area of a circle based on a given radius. The result is returned as an output parameter.

### Code
```sql
CREATE PROC calculateArea @radius FLOAT,@area FLOAT OUTPUT
AS
BEGIN
    SET @area = 3.14 * @radius * @radius;
END;

DECLARE @result FLOAT;
-- Execute the procedure and pass the output
exec calculateArea @radius = 4.2, @area = @result OUTPUT;
-- Display the result
SELECT @result AS CircleArea;

```
## Task 3: Procedure to Calculate the Sum of a Range of Numbers

### Description
This procedure calculates the sum of all integers within a specified range (startNum to endNum). The result is returned as an output parameter.

### Code
```sql
create proc calctotal @startnum int,@endnum int,@total int output
as
begin
	declare @currentnum int;
	set @currentnum=@startnum;
	set @total=0;

	while @currentnum<=@endnum
	begin
		set @total=@total+@currentnum;
		set @currentnum=@currentnum+1;
	end;
end;

DECLARE @sumResult INT;
-- Execute the procedure and capture the output
EXEC calctotal @startNum = 1, @endNum = 10, @total = @sumResult OUTPUT;
-- Display the result
SELECT @sumResult AS RangeSum;
```
## Task 4: Trigger to Prevent Insertions in the Department Table

### Description
This trigger prevents any user from inserting a new record into the Department table. If an insertion is attempted, a custom error message is displayed, and the transaction is rolled back.

### Code
```sql
create trigger preventDeptInsert
ON Department
instead of insert
as
begin
    -- error message
    PRINT 'Inserting a new record in the Department table is not allowed.';
	rollback transaction;
end;
--test it
insert into Department(Dept_Id,Dept_Name)
values(1,'cs')
```
## What are Stored Procedures and Triggers?

### 1. Stored Procedures
A **stored procedure** is a precompiled collection of SQL statements and control-flow logic that is stored in the database. It can be reused and executed on demand with specific parameters.

#### Why Use Stored Procedures?
- **Reusability**: Write once and reuse multiple times without redefining the logic.
- **Performance**: Precompiled and stored on the server, making execution faster.
- **Security**: Grant users permission to execute procedures without direct access to tables.
- **Consistency**: Ensures consistent application of business logic across the database.
- **Maintainability**: Centralized logic is easier to update and manage.

#### Examples of Use Cases
- Performing calculations (e.g., area of a circle, sum of a range).
- Fetching data based on specific criteria (e.g., student count per department).
- Automating repetitive tasks, such as data aggregation or updates.

---

### 2. Triggers
A **trigger** is a special type of stored procedure that executes automatically in response to specific events on a table or view (e.g., `INSERT`, `UPDATE`, `DELETE`).

#### Why Use Triggers?
- **Automation**: Automatically enforce rules or perform actions without user intervention.
- **Data Integrity**: Ensure consistent and valid data by enforcing constraints at the database level.
- **Audit Trails**: Track changes to critical data by logging actions in audit tables.
- **Prevention**: Restrict unauthorized operations, like blocking inserts on restricted tables.

#### Examples of Use Cases
- Preventing specific actions, such as inserting data into a restricted table.
- Automatically updating related tables when an event occurs.
- Logging changes to data for security or compliance purposes.

---

### Comparison Between Stored Procedures and Triggers

| Feature               | Stored Procedures                        | Triggers                                    |
|-----------------------|------------------------------------------|--------------------------------------------|
| **Execution**         | Explicitly executed by the user.         | Automatically executed when an event occurs. |
| **Use Case**          | General-purpose logic, reusable actions. | Enforce rules or react to table events.     |
| **Performance**       | High, as they are precompiled.           | Can impact performance if overused.        |
| **Control**           | Fully controlled by the caller.          | Executes without user initiation.          |

---

### Conclusion
- Use **stored procedures** when you need reusable, parameterized logic for tasks like calculations or data retrieval.
- Use **triggers** to enforce rules or automate reactions to specific database events.

Both tools are essential for creating efficient, secure, and robust database systems.

