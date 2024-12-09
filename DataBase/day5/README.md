# Day 5 SQL Tasks

This document explains the SQL views created for the assignments on Day 5.

## Task 1: View to Display Student Names and Course Names

### Description
This view retrieves the full name of students and the names of the courses they are enrolled in, but only if their grade is greater than 50. 

### Code
```sql
create view StudentCourseV
as
select CONCAT(St_Fname,' ',St_Lname) as FullName,Crs_Name,Grade
from Student
inner join Stud_Course on Student.St_Id=Stud_Course.St_Id
inner join Course on Stud_Course.Crs_Id=Course.Crs_Id
where Stud_Course.Grade>50;

select * from StudentCourseV
```
## Task 2: Encrypted View for Instructor Names and Topics

### Description
This view displays instructor names along with the topics they teach. The WITH ENCRYPTION clause secures the view's definition from being read by others. 

### Code
```sql
create view InstructorsTopics with encryption
as
select Ins_Name,Topic.Top_Name
from Instructor
inner join Topic on Instructor.Ins_Id=Topic.Top_Id

select * from InstructorsTopics
```

