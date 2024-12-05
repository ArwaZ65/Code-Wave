# 🎓 UniversityDB: Database Schema and Operations


Here is an attractive and well-structured README.md file for your GitHub project that explains the task and includes detailed steps. This README format is designed to make the content easily understandable and visually engaging for others.

📚 UniversityDB SQL Project
This project demonstrates advanced SQL techniques using the UniversityDB database. The tasks showcase querying, ranking, and creating custom functions for dynamic and reusable operations. These examples are great for learning SQL features like RANK(), ROW_NUMBER(), table-valued functions, and multi-statement table-valued functions.



---

## 🚀 Steps to Create and Manage the Database
###🔧 Database Overview
The project is built on a university database (UniversityDB) with the following tables:

Instructor: Contains details about instructors, their departments, and salaries.
Students: Stores student information like names, department IDs, and more.
Department: Tracks department details, including managers and hiring dates.
📜 Project Highlights
1. Top 2 Salaries Across the Database
This query retrieves the two highest salaries of instructors from the Instructor table, regardless of their department.

```sql
SELECT TOP 2 salary, name, InsID
FROM Instructor
ORDER BY salary DESC;
```
2. Top 2 Salaries in Each Department
We rank salaries for instructors within their departments and select the top 2 using the RANK() function.

Step 1: Rank Salaries in Each Department
```sql
SELECT 
    DID,
    salary,
    RANK() OVER (PARTITION BY DID ORDER BY salary DESC) AS Rank
FROM Instructor
WHERE salary IS NOT NULL;
```
Step 2: Extract Top 2 Salaries
```
WITH RankedSalaries AS (
    SELECT 
        DID, 
        salary, 
        RANK() OVER (PARTITION BY DID ORDER BY salary DESC) AS Rank
    FROM Instructor
    WHERE salary IS NOT NULL
)
SELECT DID, salary, Rank
FROM RankedSalaries
WHERE Rank <= 2;
```
3. Random Student from Each Department
This query selects a random student from each department using the ROW_NUMBER() function and NEWID() for randomness.

```sql
WITH RandomStudent AS (
    SELECT 
        F_name + ' ' + L_name AS fullname,
        s.DID,
        s.SID,
        ROW_NUMBER() OVER (PARTITION BY DID ORDER BY NEWID()) AS RankNumber
    FROM students s
)
SELECT DID, SID, fullname
FROM RandomStudent
WHERE RankNumber = 1;
```
4. Multi-Statement Table-Valued Function: Values Between Two Numbers
This function generates a range of integers between two specified numbers.

```sql
CREATE FUNCTION GetValuesBetween(
    @Start INT,
    @End INT
)
RETURNS @ResultTable TABLE (Value INT)
AS
BEGIN
    DECLARE @Value INT = @Start;
    WHILE @Value <= @End
    BEGIN
        INSERT INTO @ResultTable (Value) VALUES (@Value);
        SET @Value = @Value + 1;
    END
    RETURN;
END;

SELECT * FROM dbo.GetValuesBetween(5, 10);
```
5. Table-Valued Function: Student Data
This function returns the department name and full name of a student by their student ID.

```sql
CREATE FUNCTION StudentData(@studentnum INT)
RETURNS TABLE
AS
RETURN (
    SELECT 
        d.name AS departmentName,
        s.F_name + ' ' + s.L_name AS FullName
    FROM students s
    JOIN Department d ON s.DID = d.DID
    WHERE s.SID = @studentnum
);

SELECT * FROM StudentData(1);
```
6. Manager Details with Dynamic Hiring Date Format
This function dynamically formats the hiring date based on the input format code.

```sql
CREATE FUNCTION GetManagerDetails(@Format INT)
RETURNS TABLE
AS
RETURN (
    SELECT 
        d.name AS DepartmentName,
        i.name AS ManagerName,
        CASE 
            WHEN @Format = 1 THEN CONVERT(VARCHAR(10), d.HiringDate, 101) -- MM/DD/YYYY
            WHEN @Format = 2 THEN CONVERT(VARCHAR(10), d.HiringDate, 120) -- YYYY-MM-DD
            WHEN @Format = 3 THEN CONVERT(VARCHAR(10), d.HiringDate, 103) -- DD/MM/YYYY
            ELSE CONVERT(VARCHAR(10), d.HiringDate, 105) -- DD-MM-YYYY
        END AS HiringDate
    FROM Department d
    JOIN Instructor i ON d.InsID = i.InsID
);

SELECT * FROM GetManagerDetails(2);
```
7. Multi-Valued Function: Get Student First Names
This function returns the first names of all students based on the input keyword.

```sql
CREATE FUNCTION GetStudentsName(@input VARCHAR(50))
RETURNS @Result TABLE (Name VARCHAR(255))
AS 
BEGIN
    IF @input = 'first name'
    BEGIN
        INSERT INTO @Result (Name)
        SELECT F_name FROM students;
    END
    RETURN;
END;
SELECT * FROM GetStudentsName('first name');
```
