01."Create a database named employee,then import data_science_team.csv proj_table.csv and
 emp_record_table.csv intotheemployee database from the given resources"

use root;
create database employee; 
use employee;
use root;
select * from data_science_team;

Select * from proj_table; 

create database emp_record_table;
use emp_record_table;
select * from emp_record_table; 




02." from the employee record table, and make a list of employees and details of their department. Write a query to
 fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, and DEPARTMENT "


USE EMP_RECORD_TABLE;
SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT FROM EMP_RECORD_TABLE;




03." Write a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPARTMENT,and EMP_RATING if
 the EMP_RATING is :
                less than two "
              
USE EMP_RECORD_TABLE;
SELECT EMP_ID,FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING
FROM EMP_RECORD_TABLE
WHERE EMP_RATING<2;


. " greater than four "

USE EMP_RECORD_TABLE;
SELECT EMP_ID,FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING
FROM EMP_RECORD_TABLE
WHERE EMP_RATING>4;


. " between two and four " 

USE EMP_RECORD_TABLE;
SELECT EMP_ID,FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING
FROM EMP_RECORD_TABLE
WHERE EMP_RATING BETWEEN 2 AND 4;




04.  " Write a query to concatenate the FIRST_NAME and the LAST_NAME of employees in theFinance department 
from the employee table and then give the resultant column alias as NAME. "

SELECT CONCAT (FIRST_NAME, ' ', LAST_NAME) AS name 
FROM emp_record_table WHERE DEPT = 'Finance'; 




05. " Write a query to list down all the employees from the healthcare and finance departmentsusing union. Take data
 from the employee record table."

SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, dept, role, exp, country, continent, salary, manager_id, EMP_RATING
FROM emp_record_table WHERE dept = 'Healthcare' union 
SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, dept,role, exp, country, continent, salary, manager_id, EMP_RATING
FROM emp_record_table 
WHERE dept = 'Finance'; 




06. " Write a query to list down employee details such as EMP_ID, FIRST_NAME, LAST_NAME,ROLE, 
DEPARTMENT, and EMP_RATING grouped by dept. Also include the respective employee rating along with the max
 emprating for the department."
 
SELECT EMP_ID, FIRST_NAME, LAST_NAME, ROLE, dept, EMP_RATING, 
MAX(EMP_RATING) OVER (PARTITION BY dept) AS MAX_EMP_RATING 
FROM emp_record_table order by dept; 




07. "Write a query to calculate the minimum and the maximum salary of the employees in eachrole. Take data from 
the employee record table."

SELECT role, MIN(salary) AS min_salary, 
MAX(salary) AS max_salary FROM emp_record_table GROUP BY role; 




08. "  Write a query to assign ranks to each employee based on their experience. Take data fromthe employee record
 table."
 
SELECT emp_id, first_name, role, exp, 
RANK() OVER (ORDER BY exp DESC) AS exp_rank 
FROM emp_record_table; 




09. "  Write a query to create a view that displays employees in various countries whose salary ismore than six
 thousand. Take data from the employee record table."
 
CREATE VIEW emp_salary AS 
SELECT emp_id, first_name, last_name, role, country, salary 
FROM emp_record_table WHERE salary > 6000; 

Select * from emp_salary; 




10. "Write a nested query to find employees with experience of more than ten years. Take datafrom the employee
 record table"
 
SELECT emp_id, first_name, last_name, role 
FROM (SELECT * FROM emp_record_table WHERE exp > 10) AS Exp10; 





11 . " Write a query to create a stored procedure to retrieve the details of the employees whoseexperience is more
 than three years. Take data from the employee record table."
 
 CREATE DEFINER=`root`@`localhost` PROCEDURE `employee`()
 BEGIN
 select * from emp_record_table where exp > 3;
 END
 call employee;




 
12. " Write a query to calculate the bonus for all the employees, based on their ratings andsalaries (Use the
 formula: 5% of salary * employee rating)"

SELECT EMP_ID, FIRST_NAME, LAST_NAME, SALARY, EMP_RATING, 
(0.05 * SALARY * EMP_RATING) AS BONUS 
FROM emp_record_table; 





13. " Write a query to calculate the average salary distribution based on the continent and country.Take data from the
 employee record table"

SELECT continent, country, 
AVG(salary) AS average_salary FROM emp_record_table 
GROUP BY continent, country; 

