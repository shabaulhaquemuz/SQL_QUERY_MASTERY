 -- Creating a database
 CREATE database sql_mastery;
 
 -- Using the database
 USE sql_mastery;
 
 
 -- Creating table
 CREATE TABLE student_regex(
 id INT AUTO_INCREMENT PRIMARY KEY,
 student_name VARCHAR(100) NOT NULL,
 email VARCHAR(100) UNIQUE NOT NULL,
 dob DATE,
 course VARCHAR(100),
 fee INT NOT NULL,
 contact BIGINT NOT NULL,
 city VARCHAR(100)
  );
  
  -- Adding new column
  ALTER TABLE student_regex ADD COLUMN admission_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
  ALTER TABLE student_regex ADD COLUMN gender VARCHAR(100);
  
  -- Show existing table in current database
  SHOW TABLES;
  
  -- Describing the structure of that table
  DESCRIBE student_regex;
  
  -- Show everything about the table
  SELECT * FROM student_regex;
  
  -- Moving gender column after student_name
  ALTER TABLE student_regex MODIFY gender VARCHAR(10) AFTER student_name;
  
  -- Watching table again
  SELECT * FROM student_regex;
  
  -- Inserting Values into tables
  INSERT INTO student_regex (id, student_name, gender, email, dob, course, fee, contact, city, admission_date)
  VALUES
(1,'Aarav','Male','aarav1@example.com','2000-03-12','Data Science',75000,9876543210,'Delhi',CURRENT_TIMESTAMP),
(2,'Vivaan','Male','vivaan2@example.com','2001-07-19','ML Engineer',82000,9876543211,'Delhi',CURRENT_TIMESTAMP),
(3,'Aditya','Male','aditya3@example.com','1999-11-25','Data Analysis',68000,9876543212,'Delhi',CURRENT_TIMESTAMP),
(4,'Rohan','Male','rohan4@example.com','2002-02-14','AI Engineer',91000,9876543213,'Delhi',CURRENT_TIMESTAMP),
(5,'Arjun','Male','arjun5@example.com','2000-06-07','MERN Technology',55000,9876543214,'Delhi',CURRENT_TIMESTAMP),
(6,'Kabir','Male','kabir6@example.com','2003-12-30','Summer Internship',72000,9876543215,'Delhi',CURRENT_TIMESTAMP),
(7,'Krishna','Male','krishna7@example.com','2001-05-21','Data Science',80000,9876543216,'Delhi',CURRENT_TIMESTAMP),
(8,'Vihaan','Male','vihaan8@example.com','1999-09-17','ML Engineer',59000,9876543217,'Delhi',CURRENT_TIMESTAMP),
(9,'Shaurya','Male','shaurya9@example.com','2002-08-03','Data Analysis',77000,9876543218,'Delhi',CURRENT_TIMESTAMP),
(10,'Aryan','Male','aryan10@example.com','2000-01-28','AI Engineer',94000,9876543219,'Delhi',CURRENT_TIMESTAMP),

(11,'Aanya','Female','aanya11@example.com','2001-04-11','Data Science',63000,9876543220,'Udaipur',CURRENT_TIMESTAMP),
(12,'Saanvi','Female','saanvi12@example.com','1999-10-09','ML Engineer',71000,9876543221,'Udaipur',CURRENT_TIMESTAMP),
(13,'Ira','Female','ira13@example.com','2002-03-22','Data Analysis',87000,9876543222,'Udaipur',CURRENT_TIMESTAMP),
(14,'Anika','Female','anika14@example.com','2000-07-15','AI Engineer',59000,9876543223,'Udaipur',CURRENT_TIMESTAMP),
(15,'Myra','Female','myra15@example.com','2001-12-05','MERN Technology',66000,9876543224,'Udaipur',CURRENT_TIMESTAMP),
(16,'Diya','Female','diya16@example.com','2003-05-27','Summer Internship',72000,9876543225,'Udaipur',CURRENT_TIMESTAMP),
(17,'Riya','Female','riya17@example.com','2000-11-19','Data Science',95000,9876543226,'Udaipur',CURRENT_TIMESTAMP),
(18,'Kavya','Female','kavya18@example.com','2004-01-30','ML Engineer',55000,9876543227,'Udaipur',CURRENT_TIMESTAMP),
(19,'Anaya','Female','anaya19@example.com','2001-06-12','Data Analysis',88000,9876543228,'Udaipur',CURRENT_TIMESTAMP),
(20,'Navya','Female','navya20@example.com','1999-09-23','AI Engineer',79000,9876543229,'Udaipur',CURRENT_TIMESTAMP),

(21,'Shailee','Other','shailee21@example.com','2000-02-02','Data Science',67000,9876543230,'Jaipur',CURRENT_TIMESTAMP),
(22,'Aarohi','Other','aarohi22@example.com','2002-11-14','ML Engineer',72000,9876543231,'Jaipur',CURRENT_TIMESTAMP),
(23,'Tanish','Other','tanish23@example.com','2001-08-20','Data Analysis',81000,9876543232,'Jaipur',CURRENT_TIMESTAMP),
(24,'Prisha','Other','prisha24@example.com','2003-03-09','AI Engineer',55000,9876543233,'Jaipur',CURRENT_TIMESTAMP),
(25,'Samarth','Other','samarth25@example.com','2000-12-29','MERN Technology',97000,9876543234,'Jaipur',CURRENT_TIMESTAMP),
(26,'Mahi','Other','mahi26@example.com','2004-05-06','Summer Internship',61000,9876543235,'Jaipur',CURRENT_TIMESTAMP),
(27,'Yash','Other','yash27@example.com','1999-07-18','Data Science',88000,9876543236,'Jaipur',CURRENT_TIMESTAMP),
(28,'Pranav','Other','pranav28@example.com','2002-10-11','ML Engineer',75000,9876543237,'Jaipur',CURRENT_TIMESTAMP),
(29,'Kiara','Other','kiara29@example.com','2001-01-23','Data Analysis',94000,9876543238,'Jaipur',CURRENT_TIMESTAMP),
(30,'Reyansh','Other','reyansh30@example.com','2003-09-05','AI Engineer',59000,9876543239,'Jaipur',CURRENT_TIMESTAMP),

(31,'Dev','Male','dev31@example.com','2002-06-12','Data Science',71000,9876543240,'Mumbai',CURRENT_TIMESTAMP),
(32,'Karan','Male','karan32@example.com','2000-09-08','ML Engineer',83000,9876543241,'Bangalore',CURRENT_TIMESTAMP),
(33,'Ritvik','Male','ritvik33@example.com','1999-11-02','Data Analysis',65000,9876543242,'Pune',CURRENT_TIMESTAMP),
(34,'Manav','Male','manav34@example.com','2001-03-25','AI Engineer',77000,9876543243,'Kolkata',CURRENT_TIMESTAMP),
(35,'Laksh','Male','laksh35@example.com','2002-12-14','MERN Technology',59000,9876543244,'Chennai',CURRENT_TIMESTAMP),
(36,'Dhruv','Male','dhruv36@example.com','2003-04-18','Summer Internship',72000,9876543245,'Hyderabad',CURRENT_TIMESTAMP),
(37,'Arnav','Male','arnav37@example.com','2000-08-09','Data Science',81000,9876543246,'Lucknow',CURRENT_TIMESTAMP),
(38,'Raghav','Male','raghav38@example.com','2001-05-21','ML Engineer',94000,9876543247,'Patna',CURRENT_TIMESTAMP),
(39,'Aarush','Male','aarush39@example.com','2002-10-16','Data Analysis',55000,9876543248,'Surat',CURRENT_TIMESTAMP),
(40,'Vivaan','Male','vivaan40@example.com','2003-02-11','AI Engineer',67000,9876543249,'Indore',CURRENT_TIMESTAMP),

(41,'Sneha','Female','sneha41@example.com','2000-06-28','Data Science',75000,9876543250,'Delhi',CURRENT_TIMESTAMP),
(42,'Anjali','Female','anjali42@example.com','2001-09-13','ML Engineer',88000,9876543251,'Udaipur',CURRENT_TIMESTAMP),
(43,'Pooja','Female','pooja43@example.com','1999-12-30','Data Analysis',63000,9876543252,'Jaipur',CURRENT_TIMESTAMP),
(44,'Ritika','Female','ritika44@example.com','2002-03-05','AI Engineer',92000,9876543253,'Mumbai',CURRENT_TIMESTAMP),
(45,'Meera','Female','meera45@example.com','2001-07-21','MERN Technology',59000,9876543254,'Bangalore',CURRENT_TIMESTAMP),
(46,'Ishita','Female','ishita46@example.com','2003-11-18','Summer Internship',71000,9876543255,'Pune',CURRENT_TIMESTAMP),
(47,'Tara','Female','tara47@example.com','2000-02-07','Data Science',86000,9876543256,'Kolkata',CURRENT_TIMESTAMP),
(48,'Kiara','Female','kiara48@example.com','2004-04-14','ML Engineer',78000,9876543257,'Chennai',CURRENT_TIMESTAMP),
(49,'Mira','Other','mira49@example.com','2002-08-26','Data Analysis',95000,9876543258,'Hyderabad',CURRENT_TIMESTAMP),
(50,'Sia','Other','sia50@example.com','2001-01-12','AI Engineer',67000,9876543259,'Lucknow',CURRENT_TIMESTAMP);

-- Sneaking table again
SELECT * FROM student_regex;

-- Selecting specific columns:
SELECT student_name, gender, email,fee FROM student_regex;

-- Filter rows with WHERE clause
SELECT * FROM student_regex WHERE gender = "Male";
SELECT * FROM student_regex WHERE gender = "Female";
SELECT * FROM student_regex WHERE gender = "Other";


-- Practice: WHERE Clause
-- 1. Select all students from Delhi
SELECT * FROM student_regex WHERE city = "Delhi";

-- 2.Select all female students
SELECT * FROM student_regex WHERE gender = "Female";

-- 3.Select students with fee greater than 75,000
SELECT * FROM student_regex WHERE fee > 75000;

-- 4.Select students enrolled in ‘Data Science’ or ‘AI Engineer’ course
SELECT * FROM student_regex WHERE course = "Data Science" OR course ="AI Engineer";

-- 5.Select students from Udaipur whose fee is less than 70,000
SELECT * FROM student_regex WHERE city = "Udaipur" AND fee < 70000;

-- 6.Select students whose name starts with 'A'
SELECT * FROM student_regex WHERE student_name LIKE "A%";

-- 7.Select students born between 2000-01-01 and 2002-12-31
SELECT * FROM student_regex WHERE dob BETWEEN "2000-01-01" AND "2002-01-01";

-- 8.Select students whose gender is not 'Male'
SELECT * FROM student_regex WHERE gender != "Male";
SELECT * FROM student_regex WHERE gender <> "Male";

-- 9.Select students whose fee is either 55,000, 60,000, or 65,000
SELECT * FROM student_regex WHERE fee = 55000 OR fee = 60000 OR fee = 65000;
SELECT * FROM student_regex WHERE fee IN(55000,60000,65000);

-- 10.Select students whose city is not specified as Delhi, Udaipur, or Jaipur
SELECT * FROM student_regex WHERE city <> "Delhi" AND city <> "Udaipur" AND city <> "Jaipur";
SELECT * FROM student_regex WHERE city != "Delhi" AND city != "Udaipur" AND city != "Jaipur";
SELECT * FROM student_regex WHERE city NOT IN ("Delhi","Udaipur","Jaipur");
  
  
-- 11.Select all students except males.
SELECT * FROM student_regex WHERE gender != "Male";
SELECT * FROM student_regex WHERE gender <> "Male";
SELECT * FROM student_regex WHERE gender NOT IN ("Male") ;

-- 12.Select students whose name ends with ‘a’.
SELECT * FROM student_regex WHERE student_name LIKE "%A";

-- 13.Select students whose name contains ‘sh’.
SELECT * FROM student_regex WHERE student_name LIKE "%sh%";

-- 14.Select students whose email ends with ‘@gmail.com’.
SELECT * FROM student_regex WHERE email LIKE "%@gmail.com";

-- 15. Select students whose email ends with ‘@example.com’.
SELECT * FROM student_regex WHERE email LIKE "%@example.com";

-- 16.Select students born after year 2002.
SELECT * FROM student_regex WHERE dob > 2002-12-31;

-- 17.Select students born between 2000 and 2003.
SELECT * FROM student_regex WHERE dob > "2000-12-31" AND dob < "2003-01-01";
SELECT * FROM student_regex WHERE dob BETWEEN "2000-12-31" AND "2003-01-01";

-- 18.Select students whose contact number starts with 98.
SELECT * FROM student_regex WHERE contact LIKE "98%";

-- 19.Select students where admission_date is today.
SELECT * FROM student_regex where DATE(admission_date) = CURDATE();

-- 20.Select students whose fee is not specified (NULL).
-- SELECT * FROM student_regex WHERE fee = NULL; -- n SQL = NULL does not work — NULL is not a value, 
-- it’s a special marker meaning "unknown".
SELECT * FROM student_regex WHERE fee IS NULL;

-- 21.Select students whose fee is specified (NOT NULL).
SELECT * FROM student_regex WHERE fee IS NOT NULL;

-- 22.Select students who are Female from Jaipur with fee > 80,000 (multiple conditions).
SELECT * FROM student_regex WHERE gender = "Female" AND city = "Jaipur" AND fee > 80000;
-- to check if female from jaipur has fee >80000.
select * from student_regex where gender= "female";
