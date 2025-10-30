CREATE DATABASE testing12;
USE testing12;

CREATE table xyz(id int, name varchar(20));
INSERT INTO xyz values(11,'aman'),(12,'user');
SELECT * FROM xyz;

-- transaction
-- transaction start
-- ddl,dml
-- transaction end

-- 1) autocommit=>disable auto transaction/write(start transaction)
-- 2)
-- 3)end(commit; rollback; ddl statement /dcl tatement)
-- commmit: commit is the tcl command which is used to permanently save the transaction in the database
-- rollback: it is used to discard the changes in the database

START TRANSACTION;
INSERT INTO xyz values(101,'shabaul');
SELECT * FROM xyz;  -- since auto commit is off after using 'START TRANSACTION'
commit;

START TRANSACTION;
SET SQL_SAFE_UPDATES = 0; -- SAFE MODE DISABLE
DELETE FROM xyz;
INSERT INTO xyz values(10001,'saif');
SELECT * FROM xyz;
rollback;      -- revert the transaction

-- even when we dont write commit and istead of writing commit if we write any ddl or dcl command 
-- our transactions are saved without using commit.
start transaction;
insert into xyz values(19876,'pritam');
select * from xyz;

CREATE TABLE ddl_check(id int); -- ddl command runs hence the transaction is saved

-- SAVEPOINT
START TRANSACTION;
UPDATE xyz set name="shabaul";
savepoint shabaul_savepoint;
INSERT INTO xyz VALUES(43221,'AMAAN');
ROLLBACK TO shabaul_savepoint;
SELECT * FROM xyz;

-- DROP AND TRUNCATE CANT BE REVERT BACK BUT ON OTHER HAND DELETE CAN BE REVERT BACK BECAUSE DEROP AND TRUNCATE 
-- ARE DDL COMMANDS AND THEY DO PERMANENT CHANGES

-- RECURSIVE CTE

-- A Recursive CTE (Common Table Expression) is a self-referencing, temporary result set in SQL that 
-- repeatedly executes a query until a specified condition is met, making it highly useful for 
-- processing hierarchical data or generating sequential data.

-- It is defined using the WITH RECURSIVE keyword and consists of two parts:
-- an anchor query (the base result), and
-- a recursive query (which repeatedly references the CTE itself until a stop condition is met).


-- WITH RECURSIVE cte AS (
-- SELECT emp.employeeid, emp.employeename, emp.employeename AS managerchain
-- from employees as emp 
-- where emp.managerid is null)
-- UNION 
-- select emp.employeeid, emp.employeename,
-- concat(mgr.managerchain, '->', emp.employeename) AS managerchain
-- from employees as emp
-- join cte as mgr on emp.managerid=mgr.employeeid;

CREATE TABLE employees (
    employeeid INT PRIMARY KEY,
    employeename VARCHAR(50),
    managerid INT
);
INSERT INTO employees (employeeid, employeename, managerid) VALUES
(1, 'CEO', NULL),
(2, 'Manager A', 1),
(3, 'Manager B', 1),
(4, 'Team Lead A1', 2),
(5, 'Team Lead A2', 2),
(6, 'Developer A1.1', 4),
(7, 'Developer B1', 3);

WITH RECURSIVE cte AS (
    -- Base case: top-level employee (no manager)
    SELECT 
        emp.employeeid,
        emp.employeename,
        emp.employeename AS managerchain
    FROM employees AS emp
    WHERE emp.managerid IS NULL

    UNION ALL

    -- Recursive part: build chain
    SELECT 
        emp.employeeid,
        emp.employeename,
        CONCAT(mgr.managerchain, ' -> ', emp.employeename) AS managerchain
    FROM employees AS emp
    JOIN cte AS mgr 
        ON emp.managerid = mgr.employeeid
)
SELECT * FROM cte;
