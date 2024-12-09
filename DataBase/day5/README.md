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
## What is a View?

A **view** in SQL is a virtual table based on the result of a query. It does not store data itself but retrieves data from the underlying tables. Views are used for:
- **Simplified Queries**: Complex queries can be encapsulated in a view to simplify usage.
- **Data Security**: Restrict access to specific columns or rows.
- **Consistency**: Centralize logic so all users access the same calculations or filtered data.
- **Reusability**: Avoid repeating complex joins or filters across multiple queries.

---

## Why Use an Encrypted View?

An **encrypted view** secures the definition of the view so that no one can read the underlying SQL query. This is useful for:
- Protecting proprietary logic.
- Restricting access to the query structure while allowing authorized users to view the data.
- Adding an extra layer of security in shared or multi-user environments.

---
## Key Differences: Regular View vs. Encrypted View

| **Feature**           | **Regular View**                                | **Encrypted View**                             |
|------------------------|------------------------------------------------|-----------------------------------------------|
| **Visibility**         | The SQL definition is visible to all users.    | The SQL definition is hidden from users.      |
| **Security**           | Limited to table-level security configurations.| Adds an additional security layer to the view.|
| **Use Case**           | General-purpose views for ease of access.      | Secure views where query logic must be hidden.|

---


