-- Aggregate Functions + GROUP BY + HAVING (30 Questions)
-- Beginner Level (1–10)
USE sql_mastery;
-- Q1. Count the total number of students.
SELECT COUNT(*) AS number_of_students FROM student_regex;

-- Q2. Count the number of male students.
SELECT COUNT(*) AS 'number_of_male' FROM student_regex WHERE gender = 'Male';
SELECT COUNT(*) AS 'number_of_female' FROM student_regex WHERE gender = 'Female';
SELECT COUNT(*) AS 'number_of_other' FROM student_regex WHERE gender = 'Other';
SELECT gender, COUNT(*) AS number_of_students FROM student_regex GROUP BY gender;

-- Q3. Find the total fee collected from all students.
SELECT * FROM student_regex;
SELECT SUM(fee) AS total_fee_collected FROM student_regex;

-- Q4. Find the average fee paid by students.
SELECT AVG(fee) AS average_fee_paid FROM student_regex;

-- Q5. Find the maximum fee paid.
SELECT MAX(fee) as maximum_fee FROM student_regex;


-- Q6. Find the minimum fee paid.
SELECT MIN(fee) as minimum_fee FROM student_regex;

-- Q7. Count distinct courses offered.
SELECT * FROM student_regex;
SELECT COUNT(DISTINCT course) AS total_distinct_course FROM student_regex;


-- Q8. Count the number of students per gender.
SELECT gender, COUNT(*) AS students_per_gender FROM student_regex GROUP BY gender;

-- Q9. Find total fee collected per city.
SELECT city, SUM(fee) AS fee_collection_per_city FROM student_regex GROUP BY city;


-- Q10. Find average fee per course.
SELECT course, AVG(fee) AS average_fee_per_course FROM student_regex GROUP BY course;


-- Intermediate Level (11–20)
-- Q11. Count the number of students per city and order by student count descending.
SELECT city, COUNT(*) AS number_of_students FROM student_regex GROUP BY city ORDER BY number_of_students DESC;

-- Q12. Find maximum fee per course.
SELECT course, MAX(fee) AS maximum_fee_per_course FROM student_regex GROUP BY course;

-- Q13. Find minimum fee per course.
SELECT course, MIN(fee) AS minimum_fee_per_course FROM student_regex GROUP BY course;

-- Q14. Count the number of students per course and gender combination.
SELECT course, gender, COUNT(*) FROM student_regex GROUP BY course, gender;

-- Q15. Find average fee per city.
SELECT * FROM student_regex;
SELECT city, AVG(fee) FROM student_regex GROUP BY city;

-- Q16. Find total fee collected per gender.
SELECT gender, SUM(fee) AS total_fee_per_gender FROM student_regex GROUP BY gender;

-- Q17. Count distinct courses per city.
SELECT city, COUNT(DISTINCT course) AS distinct_course_per_city FROM student_regex GROUP BY city;

-- Q18. Find the number of students per course who paid more than 70,000.
SELECT course, COUNT(*) AS number_of_students_per_course FROM student_regex WHERE fee>70000 GROUP BY course;

-- Q19. Find average fee per course for male students only.
SELECT course, AVG(fee) as average_fee_per_course_male FROM student_regex WHERE gender="male" GROUP BY course;
-- its a wrong querySELECT course, AVG(fee) FROM student_regex GROUP BY course HAVING gender = "male";

-- 🔹 WHERE vs HAVING
-- | Clause     | Used for filtering                | When it runs      | Example use               |
-- | ---------- | --------------------------------- | ----------------- | ------------------------- |
-- | **WHERE**  | Individual rows (before grouping) | Before `GROUP BY` | `WHERE gender = 'male'`   |
-- | **HAVING** | Groups (after aggregation)        | After `GROUP BY`  | `HAVING AVG(fee) > 80000` |

-- Correct rule:
-- HAVING is used to filter aggregated results — meaning, you can use it for:
-- 1. aggregate functions (SUM, AVG, COUNT, etc.)
-- 2. or grouped columns (those in GROUP BY)

-- Example 1 — Correct (using aggregate)
-- SELECT course, AVG(fee) AS avg_fee
-- FROM student_regex
-- GROUP BY course
-- HAVING AVG(fee) > 80000;

-- Example 2 — Correct (using grouped column)
-- SELECT city, COUNT(*) AS total_students
-- FROM student_regex
-- GROUP BY city
-- HAVING city = 'Delhi';

-- ❌ Wrong Example: 🚫 gender isn’t in GROUP BY and isn’t aggregated → logically invalid.
-- SELECT course, AVG(fee)
-- FROM student_regex
-- GROUP BY course
-- HAVING gender = 'male';


-- Q20. Count students per city with at least one female student.
SELECT city, COUNT(*) student_count_with_atleast_one_female FROM student_regex GROUP BY city
HAVING SUM(gender="female")>0;


-- Advanced Level (21–30)
-- Q21. Find cities where total fee collected is more than 500,000.
SELECT city, SUM(fee) AS total_fee FROM student_regex GROUP BY city HAVING total_fee>500000;

-- Q22. Find courses where average fee is greater than 80,000.
SELECT course, AVG(fee) AS average_fee FROM student_regex GROUP BY course HAVING average_fee>80000;

-- Q23. Count the number of students per city with more than 5 students.
SELECT city, COUNT(*) as number_of_students FROM student_regex GROUP BY city HAVING number_of_students>5;

-- Q24. Find cities where maximum fee is more than 90,000.
SELECT city, MAX(fee) AS maximum_fee_greater_than_90000 FROM student_regex GROUP BY city HAVING MAX(fee)>90000;

-- Q25. Find courses where minimum fee is less than 60,000.
SELECT course, MIN(FEE) AS minimum_fee FROM student_regex GROUP BY course HAVING minimum_fee<60000;

-- Q26. Find total fee per city and per course for courses with more than 3 students.
SELECT city,course, SUM(fee) AS total_fee FROM student_regex GROUP BY city,course HAVING COUNT(*)>3;


-- Q27. Find the number of students per gender where average fee per gender is greater than 75,000.
SELECT gender,COUNT(*) AS students_per_gender, AVG(fee) AS average_fee_per_gender FROM student_regex 
GROUP BY gender HAVING average_fee_per_gender >75000;

-- Q28. Find courses with more than 5 students and total fee exceeding 300,000.
SELECT course, COUNT(*) AS number_of_students, SUM(fee) AS total_fee
FROM student_regex GROUP BY course HAVING number_of_students>5 AND total_fee>300000;

-- Q29. Count distinct fees per city where at least 2 students exist.
SELECT city, COUNT(DISTINCT fee) as distinct_fee FROM student_regex GROUP BY city HAVING COUNT(*)>=2;

-- Q30. Find the highest fee per city where average fee per city is greater than 70,000.
SELECT city, MAX(fee) AS highest_fee_per_city, AVG(fee) AS average_fee_per_city FROM student_regex
GROUP BY city HAVING average_fee_per_city > 70000;