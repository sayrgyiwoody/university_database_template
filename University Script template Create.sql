-- Create the database
CREATE DATABASE University;

-- Use the University database
USE University;

-- Create the tables

-- Department table
CREATE TABLE Department (
  dept_name VARCHAR(100) PRIMARY KEY,
  building VARCHAR(100),
  budget DECIMAL(10,2)
);

-- Course table
CREATE TABLE Course (
  course_id INT PRIMARY KEY,
  title VARCHAR(100),
  dept_name VARCHAR(100),
  credits INT,
  FOREIGN KEY (dept_name) REFERENCES Department(dept_name)
);

-- Instructor table
CREATE TABLE Instructor (
  ID INT PRIMARY KEY,
  name VARCHAR(100),
  dept_name VARCHAR(100),
  salary DECIMAL(10,2),
  FOREIGN KEY (dept_name) REFERENCES Department(dept_name)
);

-- Student table
CREATE TABLE Student (
  ID INT PRIMARY KEY,
  name VARCHAR(100),
  dept_name VARCHAR(100),
  tot_cred INT,
  FOREIGN KEY (dept_name) REFERENCES Department(dept_name)
);

-- Takes table
CREATE TABLE Takes (
  ID INT,
  course_id INT,
  sec_id INT,
  semester VARCHAR(50),
  year INT,
  grade VARCHAR(10),
  PRIMARY KEY (ID, course_id, sec_id, semester, year),
  FOREIGN KEY (ID) REFERENCES Student(ID),
  FOREIGN KEY (course_id, sec_id, semester, year) REFERENCES Section(course_id, sec_id, semester, year)
);

-- Section table
CREATE TABLE Section (
  course_id INT,
  sec_id INT,
  semester VARCHAR(50),
  year INT,
  building VARCHAR(100),
  room_no INT,
  time_slot_id INT,
  PRIMARY KEY (course_id, sec_id, semester, year),
  FOREIGN KEY (time_slot_id) REFERENCES Time_Slot(time_slot_id),
  FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

-- Time_Slot table
CREATE TABLE Time_Slot (
  time_slot_id INT PRIMARY KEY,
  day VARCHAR(50),
  start_time TIME,
  end_time TIME
);

-- Classroom table
CREATE TABLE Classroom (
  building VARCHAR(100),
  room_no INT,
  capacity INT,
  PRIMARY KEY (building, room_no)
);

-- Teaches table
CREATE TABLE Teaches (
  ID INT,
  course_id INT,
  sec_id INT,
  semester VARCHAR(50),
  year INT,
  PRIMARY KEY (ID, course_id, sec_id, semester, year),
  FOREIGN KEY (ID) REFERENCES Instructor(ID),
  FOREIGN KEY (course_id, sec_id, semester, year) REFERENCES Section(course_id, sec_id, semester, year)
);

-- Advisor table
CREATE TABLE Advisor (
  s_id INT,
  i_id INT,
  PRIMARY KEY (s_id),
  FOREIGN KEY (s_id) REFERENCES Student(ID),
  FOREIGN KEY (i_id) REFERENCES Instructor(ID)
);

-- Prereq table
CREATE TABLE Prereq (
  course_id INT,
  prereq_id INT,
  PRIMARY KEY (course_id, prereq_id),
  FOREIGN KEY (course_id) REFERENCES Course(course_id),
  FOREIGN KEY (prereq_id) REFERENCES Course(course_id)
);

-- Insert data into the tables

-- Insert into Department table
INSERT INTO Department (dept_name, building, budget) VALUES
  ('Computer Science', 'Science Building', 100000),
  ('Mathematics', 'Math Building', 80000),
  ('Physics', 'Physics Building', 90000);

-- Insert into Course table
INSERT INTO Course (course_id, title, dept_name, credits) VALUES
  (1, 'Introduction to Computer Science', 'Computer Science', 3),
  (2, 'Database Systems', 'Computer Science', 4),
  (3, 'Calculus', 'Mathematics', 3),
  (4, 'Linear Algebra', 'Mathematics', 3),
  (5, 'Classical Mechanics', 'Physics', 4);

-- Insert into Instructor table
INSERT INTO Instructor (ID, name, dept_name, salary) VALUES
  (1, 'John Doe', 'Computer Science', 50000),
  (2, 'Jane Smith', 'Computer Science', 55000),
  (3, 'Robert Johnson', 'Mathematics', 60000),
  (4, 'Sarah Davis', 'Mathematics', 58000),
  (5, 'Michael Lee', 'Physics', 62000);

-- Insert into Student table
INSERT INTO Student (ID, name, dept_name, tot_cred) VALUES
  (1, 'Alice Adams', 'Computer Science', 90),
  (2, 'Bob Brown', 'Mathematics', 75),
  (3, 'Charlie Clark', 'Physics', 80),
  (4, 'Emily Evans', 'Computer Science', 95),
  (5, 'George Green', 'Mathematics', 82);

-- Insert into Takes table
INSERT INTO Takes (ID, course_id, sec_id, semester, year, grade) VALUES
  (1, 1, 1, 'Spring', 2022, 'A'),
  (1, 2, 1, 'Fall', 2022, 'B+'),
  (2, 3, 1, 'Spring', 2022, 'A-'),
  (2, 4, 1, 'Spring', 2022, 'B'),
  (3, 5, 1, 'Fall', 2022, 'A');

-- Insert into Section table
INSERT INTO Section (course_id, sec_id, semester, year, building, room_no, time_slot_id) VALUES
  (1, 1, 'Spring', 2022, 'Science Building', 101, 1),
  (2, 1, 'Fall', 2022, 'Science Building', 201, 2),
  (3, 1, 'Spring', 2022, 'Math Building', 101, 3),
  (4, 1, 'Spring', 2022, 'Math Building', 201, 4),
  (5, 1, 'Fall', 2022, 'Physics Building', 101, 5);

-- Insert into Time_Slot table
INSERT INTO Time_Slot (time_slot_id, day, start_time, end_time) VALUES
  (1, 'Monday', '09:00:00', '10:30:00'),
  (2, 'Wednesday', '14:00:00', '15:30:00'),
  (3, 'Tuesday', '10:00:00', '11:30:00'),
  (4, 'Thursday', '13:00:00', '14:30:00'),
  (5, 'Friday', '11:00:00', '12:30:00');

-- Insert into Classroom table
INSERT INTO Classroom (building, room_no, capacity) VALUES
  ('Science Building', 101, 50),
  ('Science Building', 201, 40),
  ('Math Building', 101, 60),
  ('Math Building', 201, 55),
  ('Physics Building', 101, 30);

-- Insert into Teaches table
INSERT INTO Teaches (ID, course_id, sec_id, semester, year) VALUES
  (1, 1, 1, 'Spring', 2022),
  (2, 2, 1, 'Fall', 2022),
  (3, 3, 1, 'Spring', 2022),
  (4, 4, 1, 'Spring', 2022),
  (5, 5, 1, 'Fall', 2022);

-- Insert into Advisor table
INSERT INTO Advisor (s_id, i_id) VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5);

-- Insert into Prereq table
INSERT INTO Prereq (course_id, prereq_id) VALUES
  (2, 1),
  (3, 1),
  (4, 3),
  (5, 4),
  (5, 3);

-- Output the inserted data
SELECT * FROM Department;
SELECT * FROM Course;
SELECT * FROM Instructor;
SELECT * FROM Student;
SELECT * FROM Takes;
SELECT * FROM Section;
SELECT * FROM Time_Slot;
SELECT * FROM Classroom;
SELECT * FROM Teaches;
SELECT * FROM Advisor;
SELECT * FROM Prereq;
