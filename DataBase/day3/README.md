# UniversityDB: Database Schema and Operations

This repository contains the complete schema design, data insertion, and manipulation queries for the `UniversityDB` database. Follow the steps below to create and manage the database.

---

## 1. Create the Database
```sql
CREATE DATABASE UniversityDB;
USE UniversityDB;
2. Create Tables
2.1 Topic Table
sql
Copy code
CREATE TABLE Topic (
    TID INT PRIMARY KEY,
    name VARCHAR(255)
);
2.2 Course Table
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
2.3 Department Table
sql
Copy code
CREATE TABLE Department (
    DID INT PRIMARY KEY,
    name VARCHAR(255),
    HiringDate DATE
);
2.4 Instructor Table
sql
Copy code
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
2.5 Add Instructor ID to Department Table
sql
Copy code
ALTER TABLE Department
ADD InsId INT;

ALTER TABLE Department
ADD FOREIGN KEY (InsId) REFERENCES Instructor(InsId);
2.6 Students Table
sql
Copy code
CREATE TABLE Students (
    SID INT PRIMARY KEY,
    F_name VARCHAR(255),
    L_name VARCHAR(255),
    age INT,
    address TEXT,
    DID INT,
    FOREIGN KEY (DID) REFERENCES Department(DID)
);
2.7 Enrollment Table
sql
Copy code
CREATE TABLE Enrollment (
    SID INT,
    CID INT,
    grades DECIMAL(4, 2),
    PRIMARY KEY (SID, CID),
    FOREIGN KEY (SID) REFERENCES Students(SID),
    FOREIGN KEY (CID) REFERENCES Course(CID)
);
2.8 Teaching Table
sql
Copy code
CREATE TABLE Teaching (
    InsID INT,
    CID INT,
    Evaluation TEXT,
    PRIMARY KEY (InsID, CID),
    FOREIGN KEY (InsID) REFERENCES Instructor(InsID),
    FOREIGN KEY (CID) REFERENCES Course(CID)
);
3. Insert Data
3.1 Insert into Department Table
sql
Copy code
INSERT INTO Department
VALUES 
    (10, 'IS', '1970-02-19', NULL),
    (15, 'CS', '1990-02-19', NULL);
3.2 Insert into Topic Table
sql
Copy code
INSERT INTO Topic
VALUES 
    (26, 'Data Structure'),
    (28, 'Programming by Python');
3.3 Insert into Students Table
sql
Copy code
INSERT INTO Students (SID, F_name, L_name, age, address, DID)
VALUES 
    (1, 'Arwa', 'Zakria', 21, '123 Cairo', 10),
    (2, 'Jane', 'Smith', 22, '456 Elm St', 15);
3.4 Insert into Instructor Table
sql
Copy code
INSERT INTO Instructor (InsID, name, bonus, address, salary, hourRate, DID) 
VALUES 
    (1, 'Alice', NULL, '789 Alex', 5000, 50, 10),
    (2, 'Bob', NULL, '321 BNS', 6000, 55, 15);
3.5 Insert into Course Table
sql
Copy code
INSERT INTO Course (CID, name, duration, description, TID) 
VALUES 
    (1, 'Programming', 30, 'C++', 26),
    (2, 'Fundamentals of Programming', 45, 'Python Basics', 28);
3.6 Insert Additional Data
sql
Copy code
INSERT INTO Department
VALUES (20, 'MM', '2000-02-19', NULL);

INSERT INTO Students
VALUES (3, 'Talia', 'Mohamed', 24, '459 BNS EG', 20);

INSERT INTO Instructor (InsID, name, bonus, address, salary, hourRate, DID) 
VALUES 
    (3, 'Fatma', NULL, 'Alexandria, Egypt', 10500, 45, 20);
4. Data Manipulation (DML)
4.1 Update Instructor Salaries
Increase all instructor salaries by 15%:

sql
Copy code
UPDATE Instructor
SET salary = (0.15 * salary) + salary;
4.2 Update Course Name
Change the name of a course:

sql
Copy code
UPDATE Course
SET name = 'Code Wave'
WHERE CID = 1;
