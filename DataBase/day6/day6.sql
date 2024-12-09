use ITI
--1
create procedure StudNum as
Begin
	select count(St_Id) as "student count",Dept_Name
	from Student
	inner join Department on Student.Dept_Id=Department.Dept_Id
	group by Dept_Name
End;

exec StudNum

--2
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

--3
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

--4
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


