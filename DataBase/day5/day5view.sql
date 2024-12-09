use ITI
---1 view
create view StudentCourseV
as
select CONCAT(St_Fname,' ',St_Lname) as FullName,Crs_Name,Grade
from Student
inner join Stud_Course on Student.St_Id=Stud_Course.St_Id
inner join Course on Stud_Course.Crs_Id=Course.Crs_Id
where Stud_Course.Grade>50;

select * from StudentCourseV

--encrputed view
create view InstructorsTopics with encryption
as
select Ins_Name,Topic.Top_Name
from Instructor
inner join Topic on Instructor.Ins_Id=Topic.Top_Id

select * from InstructorsTopics