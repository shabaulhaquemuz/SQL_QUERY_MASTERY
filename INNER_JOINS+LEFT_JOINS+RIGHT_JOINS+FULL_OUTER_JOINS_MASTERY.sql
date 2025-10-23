DROP DATABASE sql_mastery_joins;
CREATE DATABASE sql_mastery_joins;
USE sql_mastery_joins;

-- Create Database (optional)
-- CREATE DATABASE joins_practice;
-- USE joins_practice;

-- Table 1: student_regex
CREATE TABLE student_regex (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    course_id INT,
    enrollment_date DATE,
    age INT
);

-- Table 2: course_regex
CREATE TABLE course_regex (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INT,
    faculty_id INT,
    department VARCHAR(50)
);

-- Table 3: faculty_regex
CREATE TABLE faculty_regex (
    faculty_id INT PRIMARY KEY,
    faculty_name VARCHAR(100) NOT NULL,
    department VARCHAR(50),
    email VARCHAR(100),
    hire_date DATE
);

-- Insert sample data into student_regex
INSERT INTO student_regex (student_id, student_name, email, course_id, enrollment_date, age) VALUES
(1, 'Alice Johnson', 'alice@email.com', 101, '2024-01-15', 20),
(2, 'Bob Smith', 'bob@email.com', 102, '2024-01-16', 21),
(3, 'Charlie Brown', 'charlie@email.com', 101, '2024-01-17', 19),
(4, 'Diana Prince', 'diana@email.com', 103, '2024-01-18', 22),
(5, 'Eve Davis', 'eve@email.com', NULL, '2024-01-19', 20),
(6, 'Frank Miller', 'frank@email.com', 104, '2024-01-20', 23),
(7, 'Grace Lee', 'grace@email.com', 102, '2024-01-21', 21);

-- Insert sample data into course_regex
INSERT INTO course_regex (course_id, course_name, credits, faculty_id, department) VALUES
(101, 'Database Systems', 4, 201, 'Computer Science'),
(102, 'Data Structures', 3, 202, 'Computer Science'),
(103, 'Machine Learning', 4, 203, 'Computer Science'),
(104, 'Web Development', 3, NULL, 'Computer Science'),
(105, 'Operating Systems', 4, 204, 'Computer Science');

-- Insert sample data into faculty_regex
INSERT INTO faculty_regex (faculty_id, faculty_name, department, email, hire_date) VALUES
(201, 'Dr. Sarah Williams', 'Computer Science', 'sarah@college.edu', '2018-08-20'),
(202, 'Dr. Michael Chen', 'Computer Science', 'michael@college.edu', '2019-09-01'),
(203, 'Dr. Emily Rodriguez', 'Computer Science', 'emily@college.edu', '2020-01-15'),
(204, 'Dr. James Anderson', 'Computer Science', 'james@college.edu', '2017-07-10'),
(205, 'Dr. Linda Martinez', 'Mathematics', 'linda@college.edu', '2021-03-05');

-- Verify data
SELECT * FROM student_regex;
SELECT * FROM course_regex;
SELECT * FROM faculty_regex;

-- QUESTIONS:
# MySQL Joins Practice Questions

## INNER JOIN (10 Questions)

-- 1. Display all students who are enrolled in a course along with their course names.
SELECT * FROM student_regex t1
JOIN course_regex t2
ON t1.course_id = t2.course_id;
-- displaying students and course only
SELECT s.student_name, c.course_name 
FROM student_regex s
JOIN course_regex c
ON s.course_id = c.course_id;
-- 2. Show student names and the faculty teaching their courses.
SELECT s.student_name, f.faculty_name
FROM student_regex s
JOIN course_regex c ON s.course_id = c.course_id
JOIN faculty_regex f ON c.faculty_id = f.faculty_id;

-- 3. List all courses that have at least one student enrolled, showing course name and student count.
SELECT * FROM student_regex;
SELECT * FROM  course_regex;
SELECT * FROM faculty_regex;
SELECT c.course_name, COUNT(s.student_id) AS number_of_students FROM course_regex c
JOIN student_regex s
ON c.course_id = s.course_id
GROUP BY c.course_name;

-- 4. Display student names, course names, and faculty names for all enrolled students.
SELECT s.student_name, c.course_name, f.faculty_name
FROM student_regex s
JOIN course_regex c ON s.course_id = c.course_id
JOIN faculty_regex f ON c.faculty_id = f.faculty_id;

-- 5. Find all students enrolled in courses taught by "Dr. Sarah Williams".
SELECT s.student_name, c.course_name, f.faculty_name
FROM student_regex s
JOIN course_regex c
ON s.course_id = c.course_id
JOIN faculty_regex f
ON c.faculty_id = f.faculty_id
WHERE f.faculty_name='Dr. Sarah Williams';

-- 6. Show courses with their assigned faculty names (only courses that have a faculty assigned).
SELECT c.course_name, f.faculty_name FROM course_regex c
INNER JOIN faculty_regex f 
ON c.faculty_id = f.faculty_id
WHERE c.faculty_id IS NOT NULL;


-- 7. List students enrolled in "Database Systems" course.
SELECT s.student_name, c.course_name
FROM student_regex s
INNER JOIN course_regex c 
ON s.course_id = c.course_id
WHERE c.course_name = 'Database Systems';

-- 8. Display faculty members who are teaching at least one course with student enrollments.
SELECT DISTINCT f.faculty_name
FROM faculty_regex f
INNER JOIN course_regex c ON f.faculty_id = c.faculty_id
INNER JOIN student_regex s ON c.course_id = s.course_id;

SELECT f.faculty_name, COUNT(s.student_id) AS student_count
FROM faculty_regex f
INNER JOIN course_regex c ON f.faculty_id = c.faculty_id
INNER JOIN student_regex s ON c.course_id = s.course_id
GROUP BY f.faculty_name; -- what if two faculties have the same name? so always use group by on faculty_id.

SELECT f.faculty_name, COUNT(s.student_id) AS number_of_students
FROM faculty_regex f INNER JOIN course_regex c ON f.faculty_id=c.faculty_id
INNER JOIN student_regex s ON s.course_id = c.course_id
GROUP BY f.faculty_id;

-- 9. Show student emails along with their faculty's email addresses.
SELECT c.faculty_id,f.email, s.student_id, s.email
FROM student_regex s
INNER JOIN course_regex c ON s.course_id = c.course_id
INNER JOIN faculty_regex f ON c.faculty_id = f.faculty_id;

-- 10. Find all Computer Science courses that have students enrolled, showing student and course details.
SELECT c.course_id, c.course_name, s.student_id, s.student_name
FROM course_regex c INNER JOIN student_regex s ON c.course_id = s.course_id
WHERE c.department = 'Computer Science';


-- ## LEFT JOIN (10 Questions)

-- 1. Display all students and their course names (include students not enrolled in any course).
 SELECT s.student_name, c.course_name FROM student_regex s
 LEFT JOIN course_regex c ON s.course_id = c.course_id;
 
-- 2. Show all students with their faculty names (show NULL if student has no course or course has no faculty).
SELECT s.student_name, c.course_name, f.faculty_name 
FROM student_regex s LEFT JOIN course_regex c ON s.course_id=c.course_id
LEFT JOIN faculty_regex f ON c.faculty_id = f.faculty_id;

-- 3. List all students and show how many are enrolled vs not enrolled in courses.
SELECT 
    COUNT(c.course_id) AS enrolled,
    COUNT(*) - COUNT(c.course_id) AS not_enrolled
FROM student_regex s
LEFT JOIN course_regex c ON s.course_id = c.course_id;


-- 4. Display student names and course names, including students without courses.
SELECT s.student_name, c.course_name FROM student_regex s
LEFT JOIN course_regex c
ON s.course_id = c.course_id;

-- 5. Show all students with their enrollment dates and course credits (include students without courses).
SELECT s.student_id, s.student_name,s.enrollment_date,c.course_name, c.credits FROM student_regex s
LEFT JOIN course_regex c
ON s.course_id = c.course_id;


-- 6. List students and their department (from course), showing NULL for unenrolled students.
SELECT s.student_id, s.student_name,c.course_name, c.department
FROM student_regex s LEFT JOIN course_regex c
ON s.course_id = c.course_id;

-- 7. Display all students and their faculty's hire date (show NULL where applicable).
SELECT s.student_name, c.faculty_id, f.hire_date FROM student_regex s 
LEFT JOIN course_regex c ON s.course_id = c.course_id 
LEFT JOIN faculty_regex f ON c.faculty_id = f.faculty_id;

-- 8. Show student names and course credits, identifying students not taking any course.
SELECT s.student_name, c.credits, COUNT(*)-COUNT(c.course_id) AS student_not_taking_any_course
FROM student_regex s LEFT JOIN course_regex c ON s.course_id = c.course_id
GROUP BY s.student_name, c.credits;
-- solving it using if
SELECT s.student_name, c.credits,
IF(c.course_id IS NULL, "NOT ENROLLED", "ENROLLED") AS enrollment_status
FROM student_regex s LEFT JOIN course_regex c ON s.course_id = c.course_id;

-- 9. List all students with course names and faculty names (include all students even without courses).
SELECT s.student_id, s.student_name, c.course_name, f.faculty_name
FROM student_regex s LEFT JOIN course_regex c ON s.course_id = c.course_id
LEFT JOIN faculty_regex f ON c.faculty_id = f.faculty_id;


-- 10. Find students who are NOT enrolled in any course using LEFT JOIN.
SELECT s.student_id, s.student_name FROM student_regex s
LEFT JOIN course_regex c ON s.course_id = c.course_id
WHERE c.course_id IS NULL;

-- ---

-- ## RIGHT JOIN (10 Questions)

-- 1. Display all courses and their enrolled students (include courses with no students).
SELECT c.course_id, c.course_name, s.student_id, s.student_name 
FROM student_regex s
RIGHT JOIN course_regex c
ON s.course_id = c.course_id;

-- 2. Show all faculty members and the students they teach (include faculty teaching no students).
SELECT f.faculty_id, f.faculty_name, c.course_id, c.course_name, s.student_id, s.student_name
FROM student_regex s
RIGHT JOIN course_regex c ON s.course_id = c.course_id
RIGHT JOIN faculty_regex f ON f.faculty_id = c.faculty_id;

-- 3. List all courses with student count (show 0 for courses without students).
SELECT c.course_name, COUNT(s.student_id) AS total_students
FROM student_regex s
RIGHT JOIN course_regex c ON s.course_id = c.course_id
GROUP BY c.course_name;

-- 4. Display all faculty and the courses they teach (include faculty not assigned to courses).
SELECT f.faculty_id, f.faculty_name, c.course_id, c.course_name
FROM course_regex c
RIGHT JOIN faculty_regex f
ON c.faculty_id = f.faculty_id;

-- 5. Show all courses and their department along with enrolled student names 
-- (include courses without students).
SELECT c.course_id, c.course_name, c.department, s.student_id, s.student_name
FROM student_regex s
RIGHT JOIN course_regex c
ON s.course_id = c.course_id;

-- 6. List faculty names and student names they teach (show NULL for faculty with no students).
SELECT f.faculty_name, s.student_name
FROM student_regex s
RIGHT JOIN course_regex c ON c.course_id = s.course_id
RIGHT JOIN faculty_regex f ON f.faculty_id = c.faculty_id;



-- 7. Display all courses with their credits and student enrollment dates
-- (include courses with no enrollments).
SELECT c.course_name, c.credits, s.enrollment_date
FROM student_regex s 
RIGHT JOIN course_regex c ON c.course_id = s.course_id;

-- 8. Show all faculty members and count of students they're teaching (include faculty with 0 students).
SELECT f.faculty_id, f.faculty_name, COUNT(s.student_id) AS number_of_students
FROM student_regex s
RIGHT JOIN course_regex c ON s.course_id = c.course_id
RIGHT JOIN faculty_regex f ON f.faculty_id = c.faculty_id
GROUP BY f.faculty_id, f.faculty_name;

-- 9. Find courses that have NO students enrolled using RIGHT JOIN.
SELECT c.course_id, c.course_name, s.course_id
FROM student_regex s 
RIGHT JOIN course_regex c 
ON s.course_id = c.course_id
WHERE s.course_id IS NULL;

-- 10. List all faculty with their department and assigned course names (include faculty without courses).
SELECT f.faculty_id, f.faculty_name, f.department, c.course_name
FROM course_regex c 
RIGHT JOIN faculty_regex f 
ON f.faculty_id = c.faculty_id;

-- ---

-- ## FULL OUTER JOIN (10 Questions)

-- **Note:** MySQL doesn't support FULL OUTER JOIN directly. Use UNION of LEFT JOIN and RIGHT JOIN.

-- 1. Show all students and all courses, matching where possible.
SELECT s.student_name, c.course_name FROM student_regex s LEFT JOIN course_regex c
ON s.course_id = c.course_id
UNION 
SELECT s.student_name, c.course_name FROM student_regex s RIGHT JOIN course_regex c
ON s.course_id = c.course_id;

-- 2. Display all students and all faculty, showing connections where they exist.
SELECT s.student_name, f.faculty_name FROM student_regex s LEFT JOIN course_regex c
ON s.course_id = c.course_id
LEFT JOIN faculty_regex f ON c.faculty_id = f.faculty_id
UNION 
SELECT s.student_name, f.faculty_name FROM student_regex s RIGHT JOIN course_regex c
ON s.course_id = c.course_id
RIGHT JOIN faculty_regex f ON c.faculty_id = f.faculty_id;

-- 3. List all records from students and courses, highlighting unmatched records.
SELECT * FROM student_regex s LEFT JOIN course_regex c ON s.course_id = c.course_id
UNION
SELECT * FROM student_regex s RIGHT JOIN course_regex c ON s.course_id = c.course_id;

-- 4. Show complete data of students, courses, and faculty with all possible combinations.
SELECT * FROM student_regex s LEFT JOIN course_regex c ON s.course_id = c. course_id
LEFT JOIN faculty_regex f ON c.faculty_id =  f.faculty_id
UNION
SELECT * FROM student_regex s RIGHT JOIN course_regex c ON s.course_id = c. course_id
RIGHT JOIN faculty_regex f ON c.faculty_id =  f.faculty_id;

-- 5. Find all students without courses AND all courses without students.
SELECT s.student_id, s.student_name, c.course_id, c.course_name
FROM student_regex s LEFT JOIN course_regex c ON s.course_id = c.course_id
WHERE c.course_id IS NULL
UNION 
SELECT s.student_id, s.student_name, c.course_id, c.course_name
FROM student_regex s RIGHT JOIN course_regex c ON s.course_id = c.course_id
WHERE s.student_id IS NULL;

-- 6. Display all faculty without courses AND all courses without faculty.
SELECT f.faculty_name, c.course_name FROM faculty_regex f LEFT JOIN course_regex c
ON f.faculty_id = c.faculty_id WHERE c.course_id IS NULL
UNION
SELECT f.faculty_name, c.course_name FROM faculty_regex f RIGHT JOIN course_regex c
ON f.faculty_id = c.faculty_id WHERE f.faculty_id IS NULL;

-- 7. Show a complete roster of students and faculty, matched through courses where possible.
SELECT s.student_name, f.faculty_name, c.course_name FROM student_regex s
LEFT JOIN course_regex c ON c.course_id = s.course_id
LEFT JOIN faculty_regex f ON c.faculty_id = f.faculty_id
UNION
SELECT s.student_name, f.faculty_name, c.course_name FROM student_regex s
RIGHT JOIN course_regex c ON c.course_id = s.course_id
RIGHT JOIN faculty_regex f ON c.faculty_id = f.faculty_id;



-- 8. List all unmatched records across students and courses tables.
SELECT * FROM student_regex s LEFT JOIN course_regex c ON s.course_id = c.course_id
WHERE c.course_id IS NULL
UNION
SELECT * FROM student_regex s RIGHT JOIN course_regex c ON s.course_id = c.course_id
WHERE s.student_id IS NULL;

-- 9. Display students without enrollments and courses without enrollments in one result.
SELECT s.student_id, s.student_name, c.course_id, c.course_name
FROM student_regex s LEFT JOIN course_regex c ON c.course_id = s.course_id
WHERE c.course_id IS NULL
UNION
SELECT s.student_id, s.student_name, c.course_id, c.course_name
FROM student_regex s RIGHT JOIN course_regex c ON c.course_id = s.course_id
WHERE s.course_id IS NULL;

-- 10. Create a complete report showing all entities (students, courses, faculty) and their relationships.
SELECT s.student_id, s.student_name, c.course_id, c.course_name, f.faculty_id, f.faculty_name
FROM student_regex s LEFT JOIN course_regex c ON c.course_id = s.course_id
LEFT JOIN faculty_regex f ON f.faculty_id = c.faculty_id
UNION
SELECT s.student_id, s.student_name, c.course_id, c.course_name, f.faculty_id, f.faculty_name
FROM student_regex s RIGHT JOIN course_regex c ON c.course_id = s.course_id
RIGHT JOIN faculty_regex f ON f.faculty_id = c.faculty_id;

-- ---

-- ## CROSS JOIN (10 Questions)

-- 1. Generate all possible combinations of students and courses.
-- 2. Show every possible student-faculty pairing.
-- 3. Create a matrix of all students with all courses (Cartesian product).
-- 4. Display all possible course-faculty combinations.
-- 5. Generate all combinations of student names and course names.
-- 6. Show how many total combinations exist between students and courses.
-- 7. Create every possible pairing of students with faculty members.
-- 8. List all possible enrollments if every student could take every course.
-- 9. Generate a schedule showing all students with all available courses.
-- 10. Show all combinations of student emails with faculty emails.

-- ---

-- ## SELF JOIN (10 Questions)

-- **Note:** These questions work better with hierarchical data. I'll frame them creatively with existing tables.

-- 1. Find students who are enrolled in the same course (show student pairs).
-- 2. List students who enrolled on different dates but in the same course.
-- 3. Display pairs of students with the same age.
-- 4. Show faculty members from the same department (pair them up).
-- 5. Find courses with the same number of credits (show course pairs).
-- 6. List students who have enrolled in courses taught by the same faculty.
-- 7. Display students whose names start with the same letter.
-- 8. Find faculty members hired in the same year.
-- 9. Show pairs of courses from the same department.
-- 10. List students who enrolled within 2 days of each other.

-- ---

-- ## MULTIPLE JOINS (10 Questions - Combining Different Join Types)

-- 1. Show students, their courses, and faculty - but include students without courses.
-- 2. Display all courses with student count and faculty names (include courses without faculty).
-- 3. List faculty, their courses, and enrolled students (include faculty without courses).
-- 4. Show complete academic data: all students, all courses, all faculty with relationships.
-- 5. Find students enrolled in courses taught by faculty from Computer Science department.
-- 6. Display students, course credits, and faculty hire dates for all enrollments.
-- 7. Show faculty teaching students older than 20 years.
-- 8. List courses taught by Tushar Goyal or Sourabh Soni with enrolled students.
-- 9. Display students not enrolled in any course AND courses without assigned faculty.
-- 10. Create a complete report: student name, age, course name, credits, faculty name, department.

-- ---

-- ## Bonus: Advanced Join Questions (10 Questions)

-- 1. Find students enrolled in courses with more than 3 credits.
-- 2. Show faculty teaching the most students.
-- 3. List courses with no students but have an assigned faculty.
-- 4. Display students enrolled in courses taught by faculty hired after 2019.
-- 5. Find the course with maximum enrollments.
-- 6. Show students and faculty from the same department (through course).
-- 7. List faculty members not teaching any enrolled students.
-- 8. Display average age of students per course.
-- 9. Find students enrolled in multiple courses (if any exist - modify data if needed).
-- 10. Show courses taught by faculty hired before 2019 with current student count.

