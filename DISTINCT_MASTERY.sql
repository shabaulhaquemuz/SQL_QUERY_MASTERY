USE sql_mastery;


-- DISTINCT Mastery Questions with Solutions
-- Beginner Level (1–7)

-- Q1. Show all unique cities where students belong.
SELECT DISTINCT city FROM student_regex;

-- Q2. Show all unique courses.
SELECT DISTINCT course FROM student_regex;

-- Q3. Show all unique genders in the table.
SELECT DISTINCT gender FROM student_regex;

-- Q4. Show all unique fees paid by students.
SELECT DISTINCT fee FROM student_regex;

-- Q5. Show unique combinations of city and course.
SELECT DISTINCT city,course FROM student_regex;

-- Q6. Show unique student names.
SELECT DISTINCT student_name FROM student_regex;

-- Q7. Show unique courses where fee is greater than 80,000.
-- wrong way: SELECT DISTINCT course WHERE fee > 80000 FROM student_regex;
SELECT DISTINCT course FROM student_regex WHERE fee > 80000;

-- Intermediate Level (8–14)
-- Q8. Count how many unique cities are in the table.
SELECT COUNT(DISTINCT city) AS distinct_city FROM student_regex;

-- Q9. Count how many unique courses are offered.
SELECT COUNT(DISTINCT course) as unique_courses FROM student_regex;

-- Q10. Count unique students in Delhi.
SELECT COUNT(DISTINCT student_name) AS unique_students_delhi FROM student_regex WHERE city = "Delhi";

-- Q11. Show unique city-course pairs for students paying more than 70,000.
SELECT DISTINCT city, course FROM student_regex WHERE fee > 70000;

-- Q12. Show distinct emails (to verify no duplicates exist).
SELECT DISTINCT email FROM student_regex;

-- Q13. Show distinct combinations of gender and course.
SELECT DISTINCT gender, course FROM student_regex;

-- Q14. Show distinct courses for students from Udaipur.
SELECT DISTINCT course FROM student_regex WHERE city = "Udaipur";

-- Advanced Level (15–20)
-- Q15. Count distinct fees per city.
SELECT city as city, COUNT(DISTINCT fee) as "distinct fee" FROM student_regex GROUP BY city;

-- Q16. Count distinct student names per course.
SELECT course as "Course", COUNT(DISTINCT student_name) as "Number of Students" FROM student_regex
GROUP BY course;

-- Q17. Find number of unique genders per city.
SELECT city as "City", COUNT(DISTINCT gender) as "Number of Genders" FROM student_regex GROUP BY city;
-- also include which genders:
SELECT city as "City", COUNT(DISTINCT gender) as "Number of Genders", GROUP_CONCAT(DISTINCT gender) as 
"Genders" FROM student_regex GROUP BY city;

-- Q18. Show top 3 cities with the most distinct courses.
SELECT city AS "City", COUNT(DISTINCT course) as "Number_of_Courses" FROM student_regex GROUP BY city
ORDER BY Number_of_Courses DESC LIMIT 3;
-- In Order By we should always avoid using quotes in "Alias" columns.

SELECT city, COUNT(DISTINCT course) AS course_count FROM student_regex GROUP BY city ORDER BY 
course_count DESC LIMIT 3;

-- Q19. Show distinct student-name + course pairs for fee > 90000.
SELECT DISTINCT student_name, course FROM student_regex WHERE fee>90000;

-- Q20. Count distinct fees per course for students in Delhi and Udaipur only.
SELECT course AS "Course", COUNT(DISTINCT fee) AS "Distinct_Course_fee" FROM student_regex WHERE city IN ("Delhi","Udaipur")
GROUP BY course;
