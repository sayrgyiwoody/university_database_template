-- Insert data into the tables

-- Insert into Department table
INSERT INTO Department (dept_name, building, budget) VALUES
  ('Computer Science', 'Science Building', 100000),
  ('Mathematics', 'Math Building', 80000),
  ('Physics', 'Physics Building', 90000);

-- Insert into Time_Slot table
INSERT INTO Time_Slot (time_slot_id, day, start_time, end_time) VALUES
  (1, 'Monday', '09:00:00', '10:30:00'),
  (2, 'Wednesday', '14:00:00', '15:30:00'),
  (3, 'Tuesday', '10:00:00', '11:30:00'),
  (4, 'Thursday', '13:00:00', '14:30:00'),
  (5, 'Friday', '11:00:00', '12:30:00'),
  (6, 'Monday', '11:00:00', '12:30:00'),
  (7, 'Wednesday', '10:00:00', '11:30:00'),
  (8, 'Thursday', '09:00:00', '10:30:00'),
  (9, 'Tuesday', '14:00:00', '15:30:00'),
  (10, 'Friday', '13:00:00', '14:30:00');

-- Insert into Classroom table
INSERT INTO Classroom (building, room_no, capacity) VALUES
  ('Science Building', 101, 50),
  ('Science Building', 201, 40),
  ('Math Building', 101, 60),
  ('Math Building', 201, 55),
  ('Physics Building', 101, 30),
  ('Science Building', 301, 45),
  ('Math Building', 301, 70),
  ('Physics Building', 201, 25),
  ('Physics Building', 301, 35),
  ('Science Building', 401, 55);

-- Insert into Course table
INSERT INTO Course (course_id, title, dept_name, credits) VALUES
  (1, 'Introduction to Computer Science', 'Computer Science', 3),
  (2, 'Database Systems', 'Computer Science', 4),
  (3, 'Calculus', 'Mathematics', 3),
  (4, 'Linear Algebra', 'Mathematics', 3),
  (5, 'Classical Mechanics', 'Physics', 4),
  (6, 'Data Structures', 'Computer Science', 4),
  (7, 'Discrete Mathematics', 'Mathematics', 3),
  (8, 'Electromagnetism', 'Physics', 4),
  (9, 'Algorithms', 'Computer Science', 4),
  (10, 'Statistics', 'Mathematics', 3);

-- Insert into Instructor table
INSERT INTO Instructor (ID, name, dept_name, salary) VALUES
  (1, 'John Doe', 'Computer Science', 50000),
  (2, 'Jane Smith', 'Computer Science', 55000),
  (3, 'Robert Johnson', 'Mathematics', 60000),
  (4, 'Sarah Davis', 'Mathematics', 58000),
  (5, 'Michael Lee', 'Physics', 62000),
  (6, 'Emily Wilson', 'Computer Science', 53000),
  (7, 'David Brown', 'Mathematics', 57000),
  (8, 'Jennifer Taylor', 'Physics', 59000),
  (9, 'Christopher Moore', 'Computer Science', 54000),
  (10, 'Karen Anderson', 'Mathematics', 61000);

-- Insert into Student table
INSERT INTO Student (ID, name, dept_name, tot_cred) VALUES
  (1, 'Alice Adams', 'Computer Science', 90),
  (2, 'Bob Brown', 'Mathematics', 75),
  (3, 'Charlie Clark', 'Physics', 80),
  (4, 'Emily Evans', 'Computer Science', 95),
  (5, 'George Green', 'Mathematics', 82),
  (6, 'Olivia Johnson', 'Computer Science', 88),
  (7, 'Daniel Thompson', 'Mathematics', 79),
  (8, 'Sophia Anderson', 'Physics', 83),
  (9, 'Matthew Davis', 'Computer Science', 91),
  (10, 'Emma Wilson', 'Mathematics', 87);

-- Insert into Section table
INSERT INTO Section (course_id, sec_id, semester, year, building, room_no, time_slot_id) VALUES
  (1, 1, 'Spring', 2022, 'Science Building', 101, 1),
  (2, 1, 'Fall', 2022, 'Science Building', 201, 2),
  (3, 1, 'Spring', 2022, 'Math Building', 101, 3),
  (4, 1, 'Spring', 2022, 'Math Building', 201, 4),
  (5, 1, 'Fall', 2022, 'Physics Building', 101, 5),
  (6, 1, 'Spring', 2022, 'Science Building', 301, 6),
  (7, 1, 'Fall', 2022, 'Math Building', 301, 7),
  (8, 1, 'Spring', 2022, 'Physics Building', 201, 8),
  (9, 1, 'Fall', 2022, 'Physics Building', 301, 9),
  (10, 1, 'Spring', 2022, 'Science Building', 401, 10);

-- Insert into Teaches table
INSERT INTO Teaches (ID, course_id, sec_id, semester, year) VALUES
  (1, 1, 1, 'Spring', 2022),
  (2, 2, 1, 'Fall', 2022),
  (3, 3, 1, 'Spring', 2022),
  (4, 4, 1, 'Spring', 2022),
  (5, 5, 1, 'Fall', 2022),
  (6, 6, 1, 'Spring', 2022),
  (7, 7, 1, 'Fall', 2022),
  (8, 8, 1, 'Spring', 2022),
  (9, 9, 1, 'Fall', 2022),
  (10, 10, 1, 'Spring', 2022);

-- Insert into Advisor table
INSERT INTO Advisor (s_id, i_id) VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5),
  (6, 6),
  (7, 7),
  (8, 8),
  (9, 9),
  (10, 10);

-- Insert into Prereq table
INSERT INTO Prereq (course_id, prereq_id) VALUES
  (2, 1),
  (3, 1),
  (4, 3),
  (5, 4),
  (5, 3),
  (6, 2),
  (7, 3),
  (8, 4),
  (9, 5),
  (10, 6);

-- Insert into Takes table
INSERT INTO Takes (ID, course_id, sec_id, semester, year, grade) VALUES
  (1, 1, 1, 'Spring', 2022, 'A'),
  (1, 2, 1, 'Fall', 2022, 'B+'),
  (2, 3, 1, 'Spring', 2022, 'A-'),
  (2, 4, 1, 'Spring', 2022, 'B'),
  (3, 5, 1, 'Fall', 2022, 'A'),
  (4, 6, 1, 'Spring', 2022, 'A-'),
  (4, 7, 1, 'Fall', 2022, 'B'),
  (5, 8, 1, 'Spring', 2022, 'B+'),
  (5, 9, 1, 'Fall', 2022, 'A'),
  (6, 10, 1, 'Spring', 2022, 'B');

-- Output the inserted data
-- SELECT * FROM Department;
-- SELECT * FROM Time_Slot;
-- SELECT * FROM Classroom;
-- SELECT * FROM Course;
-- SELECT * FROM Instructor;
-- SELECT * FROM Student;
-- SELECT * FROM Section;
-- SELECT * FROM Teaches;
-- SELECT * FROM Advisor;
-- SELECT * FROM Prereq;
-- SELECT * FROM Takes;