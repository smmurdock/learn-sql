-- Chapter 2: Beginning Data Exploration with SELECT
-- tables used: 

-- Basic SELECT Syntax
SELECT *
FROM teachers;

-- Note that the `id` column (of type `bigserial`) automatically fills with sequential integers

-- Querying a Subset of Columns
SELECT last_name, first_name, salary
FROM teachers;

-- Using DISTINCT fo Find Unique Values
SELECT DISTINCT school
FROM teachers;

-- DISTINCT works on more than one column at a time and creates pairs of unique values
SELECT DISTINCT school, salary
FROM teachers;

-- Sorting Data with ORDER BY
SELECT first_name, last_name, salary
FROM teachers
ORDER BY salary DESC;

-- Sorting with more than one column
SELECT last_name, school, hire_date
FROM teachers
ORDER BY school ASC, hire_date DESC;

-- Filtering Rows with WHERE
-- WHERE allows you to find or exclude rows that match a specific value, a range of values, or multiple values based on criteria supplied via an operator
SELECT last_name, school, hire_date
FROM teachers
WHERE school = 'Myers Middle School';

-- Find teachers whose first name is Janet
SELECT first_name, last_name, school
FROM teachers
WHERE first_name = 'Janet';

-- List all school names in the table by exclude F.D. Roosevelt HS using the not equal operator
SELECT school
FROM teachers
WHERE school != 'F.D. Roosevelt HS';

-- Find teachers who earn $43,500 or more
SELECT first_name, last_name, salary
FROM teachers
WHERE salary >= 43500;

-- Use BETWEEN to find teachers who earn between $40,000 and $65,000 (BETWEEN is inclusive)
SELECT first_name, last_name, salary
FROM teachers
WHERE salary BETWEEN 40000 AND 65000;

-- Using LIKE and ILIKE with WHERE
-- % - wildcard matching one or more characters
-- _ - wildcard matching just one character

-- Example
-- Find `baker`
-- LIKE 'b%'
-- LIKE '%ak%'
-- LIKE '_aker'
-- LIKE 'ba_er'

-- LIKE is case sensitive (ANSI SQL standard)
-- ILIKE is not case sensitive (Postgres only)

SELECT first_name
FROM teachers
WHERE first_name LIKE 'sam%';
-- no results

SELECT first_name
FROM teachers
WHERE first_name ILIKE 'sam%';
-- returns Samuel and Samantha

-- Combining Operators with AND and OR
SELECT *
FROM teachers
WHERE school = 'Myers Middle School'
	AND salary < 40000;

SELECT *
FROM teachers
WHERE last_name = 'Cole'
	OR last_name = 'Bush';

SELECT *
FROM teachers
WHERE school = 'F.D. Roosevelt HS'
	AND (salary < 38000 OR salary > 40000);

-- Putting It All Together
-- SELECT column_names
-- FROM table_name
-- WHERE criteria
-- ORDER BY column_names;

SELECT first_name, last_name, school, hire_date, salary
FROM teachers
WHERE school LIKE '%Roos%'
ORDER BY hire_date DESC;

-- Practice
-- 1. The school district superintendent asks for a list of teachers in each school. Write a query that lists the schools in alphabetical order along with teachers ordered by last name A-Z.
SELECT school, last_name, first_name
FROM teachers
ORDER BY school, last_name;

-- 2. Write a query that finds the one teach whose first name starts with the letter S and who earns more than $40,000.
SELECT first_name, last_name, salary
FROM teachers
WHERE first_name LIKE 'S%'
	AND salary > 40000;

-- 3. Rank teachers hired since January 1, 2010, ordered by highest paid to lowest.
SELECT first_name, last_name, hire_date, salary
FROM teachers
WHERE hire_date > '2010-01-01'
ORDER BY salary DESC;