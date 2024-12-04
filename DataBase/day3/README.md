# 🎓 UniversityDB: Database Schema and Operations

Welcome to the **UniversityDB** project! This repository contains a well-structured schema design, data insertion commands, and manipulation queries to manage a university database efficiently. Whether you're learning database management or implementing it in a real-world project, this guide will help you set up and operate the database seamlessly.

---

## 🚀 Steps to Create and Manage the Database

### 1️⃣ Create the Database
Start by creating the `UniversityDB` database and selecting it:
```sql
CREATE DATABASE UniversityDB;
USE UniversityDB;
CREATE DATABASE UniversityDB;
USE UniversityDB;
```
2️⃣ Create Tables
🗂️ 2.1 Topic Table
The Topic table stores topics related to courses:
```sql
CREATE TABLE Topic (
    TID INT PRIMARY KEY,
    name VARCHAR(255)
);
```
📘 2.2 Course Table
The Course table defines courses offered by the university:
```sql
CREATE TABLE Course (
    CID INT PRIMARY KEY,
    name VARCHAR(255),
    duration INT,
    description TEXT,
    TID INT,
    FOREIGN KEY (TID) REFERENCES Topic(TID)
);
```
🏢 2.3 Department Table
The Department table holds information about university departments
```sql
CREATE TABLE Department (
    DID INT PRIMARY KEY,
    name VARCHAR(255),
    HiringDate DATE
);
```
👩‍🏫 2.4 Instructor Table
The Instructor table manages data about university instructors
```sql
CREATE TABLE Instructor (
    InsId INT PRIMARY KEY,
    name VARCHAR(250),
    address TEXT,
    bonus DECIMAL(10,2),
    salary DECIMAL(10,2),
    hourRate DECIMAL(10,2),
    DID INT,
    FOREIGN KEY (DID) REFERENCES Department(DID)
);
```
🔗 2.5 Add Instructor ID to Department Table
Add a relationship between departments and their head instructors:
```sql
ALTER TABLE Department
ADD InsId INT;

ALTER TABLE Department
ADD FOREIGN KEY (InsId) REFERENCES Instructor(InsId);
```
👩‍🎓 2.6 Students Table
The Students table contains data about enrolled students:
```sql
CREATE TABLE Students (
    SID INT PRIMARY KEY,
    F_name VARCHAR(255),
    L_name VARCHAR(255),
    age INT,
    address TEXT,
    DID INT,
    FOREIGN KEY (DID) REFERENCES Department(DID)
);
```
📚 2.7 Enrollment Table
The Enrollment table tracks student enrollments and grades:
```sql
CREATE TABLE Enrollment (
    SID INT,
    CID INT,
    grades DECIMAL(4, 2),
    PRIMARY KEY (SID, CID),
    FOREIGN KEY (SID) REFERENCES Students(SID),
    FOREIGN KEY (CID) REFERENCES Course(CID)
);
```
🧑‍🏫 2.8 Teaching Table
The Teaching table records which courses instructors teach
```sql
CREATE TABLE Teaching (
    InsID INT,
    CID INT,
    Evaluation TEXT,
    PRIMARY KEY (InsID, CID),
    FOREIGN KEY (InsID) REFERENCES Instructor(InsID),
    FOREIGN KEY (CID) REFERENCES Course(CID)
);
```
3️⃣ Insert Data
🏢 3.1 Insert into Department Table
```sql
INSERT INTO Department
VALUES 
    (10, 'IS', '1970-02-19', NULL),
    (15, 'CS', '1990-02-19', NULL);
```
3.2 Insert into Topic Table
```sql
INSERT INTO Topic
VALUES 
    (26, 'Data Structure'),
    (28, 'Programming by Python');
```
3.3 Insert into Students Table
```sql
INSERT INTO Students (SID, F_name, L_name, age, address, DID)
VALUES 
    (1, 'Arwa', 'Zakria', 21, '123 Cairo', 10),
    (2, 'Jane', 'Smith', 22, '456 Elm St', 15);
```
3.4 Insert into Instructor Table
```sql
INSERT INTO Instructor (InsID, name, bonus, address, salary, hourRate, DID) 
VALUES 
    (1, 'Alice', NULL, '789 Alex', 5000, 50, 10),
    (2, 'Bob', NULL, '321 BNS', 6000, 55, 15);
```
3.5 Insert into Course Table
```sql
INSERT INTO Course (CID, name, duration, description, TID) 
VALUES 
    (1, 'Programming', 30, 'C++', 26),
    (2, 'Fundamentals of Programming', 45, 'Python Basics', 28);
```
3.6 Insert Additional Data
```sql
INSERT INTO Department
VALUES (20, 'MM', '2000-02-19', NULL);

INSERT INTO Students
VALUES (3, 'Talia', 'Mohamed', 24, '459 BNS EG', 20);

INSERT INTO Instructor (InsID, name, bonus, address, salary, hourRate, DID) 
VALUES 
    (3, 'Fatma', NULL, 'Alexandria, Egypt', 10500, 45, 20);
```
4️⃣ Data Manipulation (DML)
📈 4.1 Update Instructor Salaries
Increase all instructor salaries by 15%:

```sql
UPDATE Instructor
SET salary = (0.15 * salary) + salary;
```
4.2 Update Course Name
Change the name of a course:

```sql
UPDATE Course
SET name = 'Code Wave'
WHERE CID = 1;
```
📖 Summary
The UniversityDB database organizes data for topics, courses, departments, students, instructors, and their relationships. With structured queries and relationships, this database efficiently manages the academic ecosystem.
