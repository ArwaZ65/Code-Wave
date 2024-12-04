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
🛠️ Table Definitions
📑 Topic Table
Stores information about topics covered in courses.

Column Name	Data Type	Constraints	Description
TID	INT	PRIMARY KEY	Unique topic ID
name	VARCHAR(255)	NOT NULL	Topic name
SQL:

sql
Copy code
CREATE TABLE Topic (
    TID INT PRIMARY KEY,
    name VARCHAR(255)
);
📑 Course Table
Defines courses offered by the university and links them to topics.

Column Name	Data Type	Constraints	Description
CID	INT	PRIMARY KEY	Unique course ID
name	VARCHAR(255)	NOT NULL	Course name
duration	INT	NOT NULL	Duration in hours
description	TEXT	-	Description of the course
TID	INT	FOREIGN KEY -> Topic	Associated topic
SQL:

sql
Copy code
CREATE TABLE Course (
    CID INT PRIMARY KEY,
    name VARCHAR(255),
    duration INT,
    description TEXT,
    TID INT,
    FOREIGN KEY (TID) REFERENCES Topic(TID)
);
(Repeat this format for other tables like Department, Students, Instructor, etc.)

📥 Data Insertion Examples
Insert Department Records
sql
Copy code
INSERT INTO Department VALUES 
(10, 'IS', '1970-02-19', NULL),
(15, 'CS', '1990-02-19', NULL);
Insert Student Records
sql
Copy code
INSERT INTO Students (SID, F_name, L_name, age, address, DID) VALUES 
(1, 'Arwa', 'Zakria', 21, '123 Cairo', 10),
(2, 'Jane', 'Smith', 22, '456 Elm St', 15);
🔄 Data Manipulation Examples
Update Instructor Salaries (15% Increase)
sql
Copy code
UPDATE Instructor 
SET salary = (0.15 * salary) + salary;
Update Course Name
sql
Copy code
UPDATE Course 
SET name = 'Code Wave' 
WHERE CID = 1;
✅ How to Use
Setup Database:

Run the CREATE DATABASE script.
Execute the table creation scripts in the given order to maintain foreign key relationships.
Insert Data:

Use the provided sample insertion scripts or create your own data.
Run Queries:

Explore the database with SELECT, UPDATE, or other SQL commands.
📜 License
This project is open-source and licensed under the MIT License.

💡 Author
Created by Arwa Zakaria. Feel free to contribute, suggest improvements, or report issues. 🚀

markdown
Copy code

This file includes:  
1. Emojis to make the sections visually appealing.  
2. Tables to organize the structure of columns and their descriptions.  
3. Syntax-highlighted code blocks for SQL scripts.  
4. Headers and subheaders for easy navigation.  
5. A Table of Contents for better organization.  

Copy and paste this code into your `README.md` file! 🎉
