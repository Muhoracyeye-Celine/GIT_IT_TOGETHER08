--- FULL PROJECT SYNTAX ----


-----CREATION OF TABLE AND INSERTION OF DATA-----


CREATE TABLE employee (
    emp_id      NUMBER PRIMARY KEY,
    emp_name    VARCHAR2(50),
    department  VARCHAR2(30),
    salary      NUMBER,
    join_date   DATE
);

INSERT INTO employee VALUES (1, 'celine', 'HR', 5000, TO_DATE('2020-01-15', 'YYYY-MM-DD'));
INSERT INTO employee VALUES (2, 'ayla', 'HR', 5500, TO_DATE('2020-02-10', 'YYYY-MM-DD'));
INSERT INTO employee VALUES (3, 'Charlie', 'HR', 5000, TO_DATE('2019-01-12', 'YYYY-MM-DD'));
INSERT INTO employee VALUES (4, 'kelly', 'IT', 7000, TO_DATE('2019-05-23', 'YYYY-MM-DD'));
INSERT INTO employee VALUES (5, 'sylvia', 'IT', 7200, TO_DATE('2020-06-25', 'YYYY-MM-DD'));
INSERT INTO employee VALUES (6, 'chris', 'IT', 7000, TO_DATE('2022-03-10', 'YYYY-MM-DD'));
INSERT INTO employee VALUES (7, 'Grace', 'Finance', 6500, TO_DATE('2019-11-01', 'YYYY-MM-DD'));
INSERT INTO employee VALUES (8, 'ines', 'Finance', 6300, TO_DATE('2020-09-14', 'YYYY-MM-DD'));
INSERT INTO employee VALUES (9, 'Ivan', 'Finance', 6700, TO_DATE('2024-08-05', 'YYYY-MM-DD'));


------Compare Values with Previous Record using LAG()-----

SELECT emp_id, emp_name, salary,
       LAG(salary) OVER (ORDER BY emp_id) AS prev_salary,
       CASE
           WHEN salary > LAG(salary) OVER (ORDER BY emp_id) THEN 'HIGHER'
           WHEN salary < LAG(salary) OVER (ORDER BY emp_id) THEN 'LOWER'
           ELSE 'EQUAL'
       END AS compare_with_prev
FROM employee;





---Ranking Employees using RANK() and DENSE_RANK()----

SELECT emp_id, emp_name, department, salary,
       RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rank_r,
       DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS dense_rank_r
FROM employee;





-----Identify Top 3 Employees per Department----

SELECT * FROM (
    SELECT emp_id, emp_name, department, salary,
           DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS sal_rank
    FROM employee
) WHERE sal_rank <= 3;




--- Find First 2 Employees to Join per Department----

SELECT * FROM (
    SELECT emp_id, emp_name, department, join_date,
           ROW_NUMBER() OVER (PARTITION BY department ORDER BY join_date) AS row_num
    FROM employee
) WHERE row_num <= 2;




--- Aggregation with Window Functions-----


SELECT emp_id, emp_name, department, salary,
       MAX(salary) OVER (PARTITION BY department) AS max_in_dept,
       MAX(salary) OVER () AS overall_max_salary
FROM employee;



