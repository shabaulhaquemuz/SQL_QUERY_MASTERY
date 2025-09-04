USE sql_mastery;
SHOW tables;
SELECT * FROM student_regex;

-- LIMIT Mastery Questions with Solutions: 
-- Basic Level (1–7)
-- Q1. Show the first 5 students in the table.
SELECT * FROM student_regex LIMIT 5;

-- Q2. Show the first 10 students ordered by student_name.
SELECT * FROM student_regex ORDER BY student_name ASC LIMIT 10;

-- Q3. Show the first 3 students who paid the highest fee.
SELECT * FROM student_regex ORDER BY fee DESC LIMIT 3;

-- Q4. Show the 5 youngest students by dob.
SELECT * FROM student_regex ORDER BY dob DESC LIMIT 5;

-- Q5. Show 3 students from Delhi only.
SELECT * FROM student_regex WHERE city = "Delhi" LIMIT 3;

-- Q6. Show first 7 students enrolled in “Data Science” course ordered by fee descending.
SELECT * FROM student_regex WHERE course = "Data Science" ORDER BY fee DESC LIMIT 7;

-- Q7. Show first 10 students ignoring order (just as they appear in the table).
SELECT * FROM student_regex LIMIT 10;



-- Intermediate Level (8–14)
-- Q8. Show the next 5 students after the first 10 (pagination).
-- Pagination is a technique to fetch data in chunks (pages) instead of all at once, 
-- which helps in managing large datasets efficiently. In mysql it is usually achieved through
-- LIMIT+OFFSET.
SELECT * FROM student_regex LIMIT 5 OFFSET 10;
SELECT * FROM student_regex LIMIT 10,5;

-- Q9. Show the 2nd highest fee-paying student.
SELECT * FROM student_regex ORDER BY fee DESC LIMIT 1 OFFSET 1;
SELECT * FROM student_regex ORDER BY fee DESC LIMIT 1,1;

-- Q10. Show the 3rd youngest student by dob.
SELECT * FROM student_regex ORDER BY dob DESC LIMIT 1 OFFSET 2;

-- Q11. Show the top 5 students by fee who are from Delhi.
SELECT * FROM student_regex WHERE city = "Delhi" ORDER BY fee DESC LIMIT 5;

-- Q12. Show the first 10 students ordered by fee descending, then student_name ascending.
SELECT * FROM student_regex ORDER BY fee DESC, student_name ASC LIMIT 10;

-- Q13. Show the 4th to 8th students by admission_date.
SELECT * FROM student_regex ORDER BY admission_date LIMIT 5 OFFSET 3;

-- Q14. Show first 3 students with fee between 60,000 and 80,000.
SELECT * FROM student_regex WHERE fee BETWEEN 60000 AND 80000 ORDER BY fee ASC LIMIT 3;

-- Advanced Level (15–20)
-- Q15. Show first 5 students from “ML Engineer” and “AI Engineer” courses.
SELECT * FROM student_regex WHERE course IN("ML Engineer", "AI Engineer") LIMIT 5;

-- Q16. Show first 5 students excluding “Delhi” city.
SELECT * FROM student_regex WHERE city <> "Delhi" LIMIT 5;
SELECT * FROM student_regex WHERE city NOT IN("Delhi") LIMIT 5;

-- Q17. Show first 5 students ordered alphabetically by city and then by fee descending.
SELECT * FROM student_regex ORDER BY city ASC, fee DESC LIMIT 5;

-- Q18. Show the last 3 students by id.
SELECT * FROM student_regex ORDER BY id DESC LIMIT 3;

-- Q19. Show 3 students starting from 6th row (skip first 5).
SELECT * FROM student_regex LIMIT 3 OFFSET 5;
SELECT * FROM student_regex LIMIT 5, 3;

-- Q20. Show top 5 students with highest fee from “Udaipur” and “Jaipur”.
SELECT * FROM student_regex WHERE city IN ("Udaipur","Jaipur") ORDER BY fee DESC LIMIT 5;