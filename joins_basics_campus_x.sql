CREATE DATABASE joins_db;
use joins_db;
show tables;

select * from users;
select * from membership;
-- inner join on users and memmbership table from joins_db

-- with aliases
SELECT * FROM joins_db.users t1
INNER JOIN joins_db.membership t2
ON t1.user_id=t2.user_id;

SELECT * FROM joins_db.users AS t1
INNER JOIN joins_db.membership AS t2
ON t1.user_id=t2.user_id;

-- without aliases
SELECT * FROM joins_db.users
INNER JOIN joins_db.membership
ON joins_db.users.user_id=joins_db.membership.user_id;

-- LEFT JOIN
SELECT * FROM joins_db.membership t1
LEFT JOIN joins_db.users t2
ON t1.user_id=t2.user_id;

-- t1 → alias for membership (left table)
-- t2 → alias for users (right table)
-- LEFT JOIN returns all rows from the left table (membership),
-- and only the matching rows from the right table (users).
-- ✅ So all rows from membership are shown, even if there’s no matching row in users.
-- Columns from users will show NULL where no match exists.

-- RIGHT JOIN
SELECT * FROM joins_db.membership t1
RIGHT  JOIN joins_db.users t2
ON t1.user_id=t2.user_id;


-- SET OPERATIONS IN SQL
-- REFER COPY FOR THEORY
-- 1. UNION
SELECT * FROM person1
UNION
SELECT * FROM person2;

-- 2. UNION ALL
SELECT * FROM person1
UNION ALL
SELECT * FROM person2;

-- 3. INTERSECT
SELECT * FROM person1
INTERSECT
SELECT * FROM person2;

-- 4. EXCEPT OR MINUS
SELECT * FROM person1
EXCEPT
SELECT * FROM person2;

SELECT * FROM person1
MINUS
SELECT * FROM person2;
-- MINUS is not supported in mysql

-- FULL OUTER JOIN
-- LEFT JOIN
SELECT * FROM joins_db.membership t1
LEFT JOIN joins_db.users t2
ON t1.user_id=t2.user_id
UNION
SELECT * FROM joins_db.membership t1
RIGHT JOIN joins_db.users t2
ON t1.user_id=t2.user_id;

-- SELF JOIN
SELECT * FROM users1;
SELECT * FROM users1 t1
JOIN users1 t2
ON t1.user_id = t2.emergency_contact;

SELECT t1.name AS name_of_person, t2.name AS emergency_person_name
FROM users1 t1 JOIN users1 t2
ON t1.user_id = t2.emergency_contact;

-- joining on more than one columns
SELECT * FROM students;
SELECT * FROM class;
SELECT * FROM students t1
JOIN class t2
ON t1.student_id = t2.class_id
AND t1.enrollment_year = t2.class_year;
