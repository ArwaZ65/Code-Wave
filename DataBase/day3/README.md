# 📚 University Database Schema and Operations  

This project provides SQL scripts to create and manage a **University Database**, supporting functionalities for topics, courses, departments, instructors, and students. The repository includes:  

- **Database creation**  
- **Table definitions**  
- **Relationships between entities**  
- **Examples of data insertion and manipulation**

---

## 📋 Table of Contents  

1. [Database Overview](#database-overview)  
2. [Table Definitions](#table-definitions)  
3. [Data Insertion Examples](#data-insertion-examples)  
4. [Data Manipulation Examples](#data-manipulation-examples)  
5. [How to Use](#how-to-use)  

---

## 🔍 Database Overview  

- **Name:** `UniversityDB`  
- **Purpose:** To manage educational entities such as courses, instructors, students, and departments efficiently.  
- **Relationships:**  
  - Courses are linked to topics.  
  - Students and instructors are associated with departments.  
  - Enrollments and teaching assignments are tracked.  

**SQL to create the database:**  

```sql
CREATE DATABASE UniversityDB;
USE UniversityDB;

create all database tables at first
1-table Topics
2. Course Table
3. Department Table
4. Instructor Table
5. Students Table
6. Enrollment Table
7. Teaching Table

second Make insetion operation
Insert Departments table,
Insert Topics table,
Insert Students table,

third DML operations
1. Update Instructor Salaries (15% Increase)
UPDATE Instructor 
SET salary = (0.15 * salary) + salary;
2. Update Course Name
UPDATE Course 
SET name = 'Code Wave' 
WHERE CID = 1;
