-- ORDER BY Practice
-- Beginner Level (1–10)student_regexstudent_regexstudent_regex
-- Q1. Retrieve all students ordered by student_name in ascending order.
SELECT * FROM student_regex ORDER BY student_name ASC;

-- Q2. Retrieve all students ordered by fee in descending order.
SELECT * FROM student_regex ORDER BY fee DESC;


-- Q3. Retrieve the youngest 5 students by dob.
SELECT * FROM student_regex ORDER BY dob DESC LIMIT 5;


-- Q4. Retrieve the oldest 5 students by dob.
SELECT * FROM  student_regex ORDER BY dob ASC LIMIT 5;


-- Q5. Retrieve students ordered by city alphabetically.
SELECT * FROM student_regex ORDER BY city ASC;


-- Q6. Retrieve students ordered by gender, then by student_name.
SELECT * FROM student_regex ORDER BY gender, student_name;

-- Q7. Retrieve students where course = 'Data Science' and order by fee.
SELECT * FROM student_regex WHERE course = "Data Science" ORDER BY fee ASC;

-- Q8. Retrieve students where city = 'Delhi' and order by dob descending.
SELECT * FROM student_regex WHERE city="Delhi" ORDER BY dob DESC;


-- Q9. Retrieve all students ordered by length of student_name.
SELECT * FROM student_regex ORDER BY LENGTH(student_name);


-- Q10. Retrieve students ordered by admission_date, newest first.
SELECT * FROM student_regex ORDER BY admission_date DESC;


-- Intermediate Level (11–20)
-- Q11. Retrieve top 3 students with the highest fee.
SELECT * FROM student_regex ORDER BY fee DESC LIMIT 3;


-- Q12. Retrieve bottom 3 students with the lowest fee.
SELECT * FROM student_regex ORDER BY fee ASC LIMIT 3;


-- Q13. Retrieve 2nd highest fee-paying student.
SELECT * FROM student_regex ORDER BY fee DESC LIMIT 1 OFFSET 1;


-- Q14. Retrieve 2nd youngest student by dob.
SELECT * FROM student_regex ORDER BY dob DESC LIMIT 1 OFFSET 1;


-- Q15. Retrieve students ordered by course ascending, then fee descending.
SELECT * FROM student_regex ORDER BY course ASC, fee DESC;


-- Q16. Retrieve students ordered by city, and inside each city, order by dob.
SELECT * FROM  student_regex ORDER BY city ASC, dob ASC;


-- Q17. Retrieve top 10% students by fee.
-- The inner query is not fetching rows at all.
-- It is only calculating a single number (the count of rows × 10%).
-- Inner query → Calculate total rows → return only the number (e.g., 12).
-- Outer query → Sort the full dataset by fee DESC.
-- Outer query → Apply LIMIT 12 to take the top 12.
-- So the inner query is not filtering students.
SELECT * FROM student_regex ORDER BY fee DESC LIMIT(SELECT CEIL(count(*)*10/100) FROM student_regex); 
-- In MySQL / MariaDB, the LIMIT clause expects a literal number or a constant expression.
-- 👉 It does not allow a subquery directly. Work if you know the rows then calculate 10 percent manually.
-- Correct Query:
SELECT * FROM student_regex ORDER BY fee DESC LIMIT 5;

-- Q18. Retrieve students ordered by contact number.
SELECT * FROM student_regex ORDER BY contact ASC;


-- Q19. Retrieve students ordered by dob(DESCENDING) but NULL values last.
SELECT * FROM student_regex ORDER BY dob DESC; -- THROWS NULL AT LAST IN DESCENDING ORDER CASE
-- Normally, when you do ORDER BY dob ASC, different databases handle NULL differently:
-- In MySQL: NULL values come first in ascending order and comes last in descending order.
-- In PostgreSQL: NULL values come last in ascending order (but can be controlled).
-- In Oracle/SQL Server: behaviors also differ.
-- 👉 The question is asking you to sort all students by date of birth, but if a student has 
-- no DOB (NULL), push those records to the bottom of the list.
-- dob IS NULL = TRUE (1) if dob is NULL.
-- dob IS NULL = FALSE (0) if dob is NOT NULL.
-- MySQL evaluates dob IS NULL for each row:
-- If dob has a value → dob IS NULL = 0
-- If dob is NULL → dob IS NULL = 1
-- Then sorting happens like this:
-- All rows with 0 (non-NULL) first, ordered by DOB ASC.
-- All rows with 1 (NULL) last.

-- Q19_PART2. Retrieve students ordered by dob(ASCCENDING) but NULL values last.
SELECT * FROM student_regex ORDER BY dob IS NULL, dob ASC;


-- Q20. Retrieve students ordered by case-insensitive student_name.
SELECT * FROM student_regex ORDER BY LOWER(student_name);
SELECT * FROM student_regex ORDER BY LOWER(student_name);




-- Advanced Level (21–30)
-- Q21. Retrieve students and order by fee, but put “AI Engineer” course students on top.
SELECT * FROM student_regex ORDER BY CASE WHEN course = "AI Engineer" THEN 1 else 2 END, fee DESC;


-- Q22. Retrieve students ordered by gender = 'Female' first, then others.
SELECT * FROM student_regex ORDER BY CASE WHEN gender = "Female" THEN 1 ELSE 2 END, gender ASC;


-- Q23. Retrieve students ordered by city = 'Udaipur' first, then all others alphabetically.
SELECT * FROM student_regex ORDER BY CASE WHEN city = "Udaipur" THEN 1 ELSE 2 END, city ASC;


-- Q24. Retrieve students ordered by course priority → (Data Science > ML Engineer > AI Engineer > MERN Technology > Summer Internship).
SELECT * FROM student_regex ORDER BY 
CASE 
WHEN course = "Data Science" THEN 1
WHEN course = "ML Engineer" THEN 2
WHEN course = "AI Engineer" THEN 3
WHEN course = "MERN Technology" THEN 4
WHEN course = "Summer Internship" THEN 5
ELSE 1000
END;

-- Q25. Retrieve students ordered by dob, but youngest male and female students first.
SELECT * FROM student_regex ORDER BY 
CASE 
WHEN gender = "Male" THEN 1
WHEN gender = "Female" THEN 1
ELSE 3
END, dob DESC;

-- ANOTHER CONCISED WAY:
SELECT * FROM student_regex ORDER BY CASE WHEN gender IN ("Male","Female") THEN 1 ELSE 2 END, dob DESC;


-- Q26. Retrieve students ordered by fee descending, but if fee is same, then earlier admission_date first.
SELECT * FROM student_regex ORDER BY fee DESC, admission_date ASC;


-- Q27. Retrieve students ordered randomly.
SELECT * FROM student_regex ORDER BY RAND();


-- Q28. Retrieve students ordered by the number of characters in course name, then by fee.
SELECT * FROM student_regex ORDER BY LENGTH(course), fee ASC;


-- Q29. Retrieve students ordered by year(dob), then by month of birth.
SELECT * FROM student_regex ORDER BY YEAR(dob) ASC, MONTH(dob) ASC;


-- Q30. Retrieve students ordered by a calculated column → fee per year of age (fee / age).
-- (YEAR(CURDATE())-YEAR(dob)) will give approx value of year
SELECT *, (fee/(YEAR(CURDATE())-YEAR(dob))) AS fee_per_year_age
FROM student_regex ORDER BY fee_per_year_age;

-- (TIMESTAMPDIFF(YEAR, dob, CURDATE())) precised value of year
SELECT *, (fee/(TIMESTAMPDIFF(YEAR, dob, CURDATE()))) AS fee_per_year_age_concised
FROM student_regex ORDER BY fee_per_year_age_concised;\

-- | Method                                | Calculation                     | Precision   | Notes                                                                           |
-- | ------------------------------------- | ------------------------------- | ----------- | ------------------------------------------------------------------------------- |
-- | `YEAR(CURDATE()) - YEAR(dob)`         | Simple difference of years      | Approximate | Ignores month/day → may overcount by 1 year if birthday hasn’t passed this year |
-- | `TIMESTAMPDIFF(YEAR, dob, CURDATE())` | Counts full years between dates | Precise     | Only counts **completed years**, correctly considers month and day of birthday  |

