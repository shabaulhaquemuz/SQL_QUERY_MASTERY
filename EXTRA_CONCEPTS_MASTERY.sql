-- NEW IMPORTANT CONCEPTS IN SEQUEL:
-- CEIL = ceiling (go up)
-- It is a mathematical function used to round a number upwards to the nearest integer.

-- FLOOR = floor (go down)
-- It is a mathematical function used to round a number upwards to the nearest integer.

-- | Function    | Input | Output | Behavior             |
-- | ----------- | ----- | ------ | -------------------- |
-- | CEIL(4.2)   | 4.2   | 5      | Rounds up            |
-- | FLOOR(4.2)  | 4.2   | 4      | Rounds down          |
-- | CEIL(-3.4)  | -3.4  | -3     | Moves toward zero    |
-- | FLOOR(-3.4) | -3.4  | -4     | Moves away from zero |


-- SELECT CEIL(4.2);   -- 5
-- SELECT CEIL(7.0);   -- 7
-- SELECT CEIL(-3.4);  -- -3   (goes "up" toward zero)
-- SELECT FLOOR(4.8);   -- 4
-- SELECT FLOOR(7.0);   -- 7
-- SELECT FLOOR(-3.4);  -- -4   (goes "down" away from zero)



-- CASE in SQL is always an expression, not a statement. It comes in two types — 
-- Simple CASE Expression (checks equality) and Searched CASE Expression (checks full conditions). 
-- If no condition matches and no ELSE is written, it returns NULL.”
-- DEFINITION: 
-- In SQL, the CASE EXPRESSION is used to apply conditional logic, 
-- similar to if–else in other programming languages.
-- It checks conditions in order and returns the result for the first condition that is true.
-- If none of the conditions are true, it returns the ELSE value.
-- If else clause is not provided then Null is returned.

-- SYNTAX:
-- 1. SIMPLE CASE EXPRESSION
-- Compares one expression to multiple values.
-- Only checks equality (=).
-- In the example below: The expression is payment_mode.
-- SQL is comparing it against multiple values ('CASH', 'CARD', 'UPI').

CASE expression
    WHEN value1 THEN result1
    WHEN value2 THEN result2
    ELSE default_result
END

-- EXAMPLE:
SELECT order_id,
       CASE payment_mode
           WHEN 'CASH' THEN 'Cash Payment'
           WHEN 'CARD' THEN 'Card Payment'
           ELSE 'Other'
       END AS payment_status
FROM orders;


-- 2.SEARCHED CASE EXPRESSION
-- Uses full conditions (>, <, BETWEEN, LIKE, etc.).
-- This is what most people call a CASE statement because it looks like if–else.
-- SYNTAX:
CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    ELSE default_result
END

-- EXAMPLE
SELECT student_name,
       CASE
           WHEN marks >= 90 THEN 'A'
           WHEN marks >= 75 THEN 'B'
           ELSE 'C'
       END AS grade
FROM students;



