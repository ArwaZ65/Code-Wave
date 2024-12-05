use UniversityDB;

select Top 2 salary,name,InsId
from Instructor
order by salary desc

----all salaries desc in each department
select DID,salary,
RANK() over (PARTITION BY DID ORDER BY salary DESC) Rank
from Instructor
where salary is not null
---make column to chooce top 2 in each department
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
--------------------random student
with RandomStudent AS(
select 
F_name+' '+L_name as fullname,s.DID,s.SID,
ROW_NUMBER() over(partition by DID order by NEWID()) AS RankNumber
from students s
)
select DID,SID,fullname,RankNumber
from RandomStudent
where RankNumber=1
---------------mult function
CREATE FUNCTION GetValuesBetween
(
    @Start INT,
    @End INT
)
RETURNS @ResultTable TABLE (Value INT)
AS
BEGIN
    DECLARE @Value INT = @Start;
    WHILE @Value <= @End
    BEGIN
        INSERT INTO @ResultTable (Value)
        VALUES (@Value);
        SET @Value = @Value + 1;
    END
    RETURN;
END;
SELECT * FROM dbo.GetValuesBetween(5, 10);
----------------table-valued function
create function StudentData(@studentnum int)
Returns Table
As
return(
	select d.name as departmentName,
	s.F_name+' '+s.L_name as FullName
from students s
join Department d on s.DID=d.DID
where s.SID= @studentnum
);
select * from StudentData(1)
-----------------------
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
            WHEN @Format = 3 THEN CONVERT (VARCHAR(10), D.HiringDate, 103) --DD/MM/YYY
            ELSE CONVERT(VARCHAR(10), d.HiringDate, 105) -- DD-MM-YYYY
        END AS HiringDate
    FROM Department d
    JOIN Instructor i ON d.InsID = i.InsID
);

SELECT * FROM GetManagerDetails(2);
-----------------------------MVFS
CREATE FUNCTION GetStudentsName(@input Varchar(50))
RETURNS @Result Table(Name varchar(255))
As 
Begin
	IF @input='first name'
	Begin
		INSERT INTO @Result (Name)
		SELECT F_name from students
	End
	
	RETURN;
END;

select * from GetStudentsName('first name')