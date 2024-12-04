create database UniversityDB;
use UniversityDB;
CREATE TABLE Topic (
    TID INT PRIMARY KEY,
    name VARCHAR(255)
); 
CREATE TABLE Course (
    CID INT PRIMARY KEY,
    name VARCHAR(255),
    duration INT,
    description TEXT,
    TID INT,
    FOREIGN KEY (TID) REFERENCES Topic(TID)
);
CREATE TABLE Department (
    DID INT PRIMARY KEY,
    name VARCHAR(255),
    HiringDate date
);

create table Instructor(
	InsId int primary key,
	name varchar(250),
	address text,
	bonus decimal(10,2),
	salary decimal (10,2),
	hourRate decimal(10,2),
	DID int,
	foreign key (DID) references Department (DID)
)
alter table Department
add InsId int
alter table Department
add foreign key (InsID) references Instructor (InsId) 

create table students(
    SID INT PRIMARY KEY,
    F_name VARCHAR(255),
    L_name VARCHAR(255),
    age INT,
    address TEXT,
    DID INT,
    FOREIGN KEY (DID) REFERENCES Department(DID)
)

CREATE TABLE Enrollment (
    SID INT,
    CID INT,
    grades DECIMAL(4, 2),
    PRIMARY KEY (SID, CID),
    FOREIGN KEY (SID) REFERENCES students(SID),
    FOREIGN KEY (CID) REFERENCES Course(CID)
);

CREATE TABLE Teaching (
    InsID INT,
    CID INT,
    Evaluation TEXT,
    PRIMARY KEY (InsID, CID),
    FOREIGN KEY (InsID) REFERENCES Instructor(InsID),
    FOREIGN KEY (CID) REFERENCES Course(CID)
);
--------------------------Insert new data-------------------------------------------------------
insert into Department
values (10,'IS','2/19/1970',NULL)
insert into Department
values (15,'CS','2/19/1990',NULL)
--insert in topic
insert into Topic
values 
(26,'data structure'),
(28,'programing by python')

--insert in student
insert into students(SID,F_name,L_name,age,address,DID)
values (1,'Arwa','Zakria',21,'123 cairo',10)
insert into students(SID,F_name,L_name,age,address,DID)
values (2, 'Jane', 'Smith', 22, '456 Elm St', 15)
--insert in instructor
INSERT INTO Instructor (InsID, name, bonus, address, salary, hourRate, DID) 
VALUES 
(1, 'Alice', NULL, '789 alex', 5000, 50, 10),
(2, 'Bob', NULL, '321 bns', 6000, 55, 15);
--insert in course table
INSERT INTO Course (CID, name, duration, description, TID) 
values 
(1, 'Programming', 30, 'C++', 26),
(2, 'Fundamental of programming', 45, 'python basics', 28);

-------------------------DML------------------
insert into Department
values (20,'MM','2/19/2000',NULL)
insert into students
values (3,'talia','mohamed',24,'459 bns eg',20)


INSERT INTO Instructor (InsID, name, bonus, address, salary, hourRate, DID) 
values 
(3, 'Fatma', NULL, 'Alexandria, Egypt', 10500, 45, 20);

--increase value of instructor 15% update
update Instructor
set salary=(0.15*salary)+salary

--update course
update Course
set name='Code Wave'
where CID=1


