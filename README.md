# 🧾✨ GIT_IT_TOGETHER08

> *“SQL isn’t just code — it’s the story of your data.”*  
> 📁 **Project Repository:** `GIT_IT_TOGETHER08`

---

## 📚 Project Title  
**Exploring SQL Window Functions – Employee Data Analysis**

---

## 👩‍💻 Team Member  
- **Céline Uwineza**  

---

## 🧑‍🏫 Instructor  
- **Eric Maniraguha**  
  🔗 GitHub: [@ericmaniraguha](https://github.com/ericmaniraguha)

---

## 🗃️ Table Structure: `EMPLOYEE`

[📄 Table Creation Script](https://github.com/Muhoracyeye-Celine/GIT_IT_TOGETHER08/blob/ce53472b5d7797a1fd89b2af54f02a0b77b83838/Project%20separate%20syntax/DATA%20CREATION%20AND%20INSERTION%20OF%20DATA.sql)  
![Table Creation](https://github.com/Muhoracyeye-Celine/GIT_IT_TOGETHER08/blob/ce53472b5d7797a1fd89b2af54f02a0b77b83838/project%20screenshots/CREATION%20AND%20INSERTION%20OF%20THE%20DATA.jpg)

```sql
CREATE TABLE employee (
  emp_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  emp_name VARCHAR2(100),
  department VARCHAR2(50),
  salary NUMBER(10, 2),
  join_date DATE
);
```

---

## 📥 Sample Data Insertion

[📄 Insert Script](https://github.com/ishimweMOSES/The-Semi-Colons/blob/7e7b2fc0bf834afc433643a57362f72aaf02d7d7/Separate%20Sql%20scripts/creating%20table%20synthax%20.sql)  
![Data Insertion](https://github.com/ishimweMOSES/The-Semi-Colons/blob/3dc3aaa9d11016ba97f08a93b47bbbe09419500e/images/table%20creation%20.png)

```sql
INSERT INTO employee (emp_name, department, salary, join_date) VALUES
('Alice', 'Finance', 4200, TO_DATE('2020-03-01', 'YYYY-MM-DD')),
('Bob', 'Finance', 4300, TO_DATE('2020-05-10', 'YYYY-MM-DD')),
('Celine', 'HR', 3900, TO_DATE('2021-01-15', 'YYYY-MM-DD')),
('David', 'HR', 4100, TO_DATE('2022-06-23', 'YYYY-MM-DD')),
('Eli', 'IT', 4700, TO_DATE('2019-11-07', 'YYYY-MM-DD')),
('Fanny', 'IT', 4700, TO_DATE('2021-09-12', 'YYYY-MM-DD')),
('Grace', 'Finance', 4400, TO_DATE('2023-02-05', 'YYYY-MM-DD')),
('Hugo', 'IT', 4600, TO_DATE('2023-03-20', 'YYYY-MM-DD'));
```

---

## 📊 Dataset Description

This project uses a fictional `EMPLOYEE` table, which stores details such as:

- 🆔 Employee ID  
- 👤 Name  
- 🏢 Department  
- 💰 Salary  
- 📅 Join Date  

It serves as a solid base to demonstrate various **analytical and window functions** in PL/SQL using Oracle SQL Developer.

---

# ✅ Assignment Requirements & Query Explanations

---

## 🔁 1. Compare Salary with Previous Records (`LAG()` + `CASE`)

[🧾 View Script](https://github.com/Muhoracyeye-Celine/GIT_IT_TOGETHER08/blob/ce53472b5d7797a1fd89b2af54f02a0b77b83838/Project%20separate%20syntax/compare%20values%20with%20previous%20record%20using%20LAG.sql)  
![LAG & CASE Output](https://github.com/Muhoracyeye-Celine/GIT_IT_TOGETHER08/blob/ce53472b5d7797a1fd89b2af54f02a0b77b83838/project%20screenshots/USING%20LAG%20AND%20LEAD.jpg)

```sql
SELECT 
  emp_id, 
  emp_name, 
  salary, 
  LAG(salary) OVER (ORDER BY emp_id) AS prev_salary,
  CASE 
    WHEN salary > LAG(salary) OVER (ORDER BY emp_id) THEN 'HIGHER'
    WHEN salary < LAG(salary) OVER (ORDER BY emp_id) THEN 'LOWER'
    ELSE 'EQUAL'
  END AS comparison
FROM employee;
```

📌 Checks how each employee’s salary compares with the previous one based on `emp_id`.

---

## 🏅 2. Rank Employees within Department (`RANK()` vs `DENSE_RANK()`)

[🧾 View Script](https://github.com/Muhoracyeye-Celine/GIT_IT_TOGETHER08/blob/ce53472b5d7797a1fd89b2af54f02a0b77b83838/Project%20separate%20syntax/ranking%20employees%20using%20RANK%20AND%20DENSE_RANNK().sql)  
![RANK vs DENSE_RANK](https://github.com/Muhoracyeye-Celine/GIT_IT_TOGETHER08/blob/ce53472b5d7797a1fd89b2af54f02a0b77b83838/project%20screenshots/USING%20RANK()%20AND%20DENSE_RANK.jpg)

```sql
SELECT 
  emp_id, 
  emp_name, 
  department, 
  salary,
  RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rank_salary,
  DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS dense_rank_salary
FROM employee;
```

📌 Ranks employees by salary in their department. Useful for rewards & reviews.

---

## 🏆 3. Top 3 Earners per Department (`DENSE_RANK()`)

[🧾 View Script](https://github.com/Muhoracyeye-Celine/GIT_IT_TOGETHER08/blob/ce53472b5d7797a1fd89b2af54f02a0b77b83838/Project%20separate%20syntax/identifying%20top%203%20employees%20per%20department.sql)  
![Top 3 Earners](https://github.com/Muhoracyeye-Celine/GIT_IT_TOGETHER08/blob/ce53472b5d7797a1fd89b2af54f02a0b77b83838/project%20screenshots/FETCHING%20TOP%203%20RECORDS%20PER%20DEPARTMENT.jpg)

```sql
SELECT *
FROM (
  SELECT 
    emp_id, 
    emp_name, 
    department, 
    salary,
    DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rank_within_dept
  FROM employee
)
WHERE rank_within_dept <= 3;
```

📌 Extracts top 3 earners from each department.

---

## 🕰️ 4. First 2 Joiners in Each Department (`ROW_NUMBER()`)

[🧾 View Script](https://github.com/Muhoracyeye-Celine/GIT_IT_TOGETHER08/blob/ce53472b5d7797a1fd89b2af54f02a0b77b83838/Project%20separate%20syntax/fetching%20top%202%20employees%20who%20joined%20the%20department%20accoirding%20to%20date.sql)  
![First 2 Joiners](https://github.com/Muhoracyeye-Celine/GIT_IT_TOGETHER08/blob/ce53472b5d7797a1fd89b2af54f02a0b77b83838/project%20screenshots/FETCHING%20TOP%20%202%20EMPLOYEES%20ACCORDIND%20TO%20DATE.jpg)

```sql
SELECT *
FROM (
  SELECT 
    emp_id, 
    emp_name, 
    department, 
    join_date,
    ROW_NUMBER() OVER (PARTITION BY department ORDER BY join_date ASC) AS row_num
  FROM employee
)
WHERE row_num <= 2;
```

📌 Gets the earliest joiners per department.

---

## 📈 5. Departmental vs Overall Max Salary (`MAX()` + Window)

[🧾 View Script](https://github.com/Muhoracyeye-Celine/GIT_IT_TOGETHER08/blob/ce53472b5d7797a1fd89b2af54f02a0b77b83838/Project%20separate%20syntax/aggregation%20with%20window%20functions.sql)  
![Max Salary Output](https://github.com/Muhoracyeye-Celine/GIT_IT_TOGETHER08/blob/ce53472b5d7797a1fd89b2af54f02a0b77b83838/project%20screenshots/AGGRETION%20BY%20WINDOW%20FUNCTIONS.jpg)

```sql
SELECT 
  emp_id, 
  emp_name, 
  department, 
  salary,
  MAX(salary) OVER (PARTITION BY department) AS max_salary_in_dept,
  MAX(salary) OVER () AS overall_max_salary
FROM employee;
```

📌 Helps benchmark salary ranges — both local and global.

---

## 🧰 Tech Stack
- 🐘 Oracle SQL Developer  
- 📂 GitHub  
- 📄 PL/SQL

---

## 🎉 Closing Note
> *“Behind every row in SQL, there’s a real-world story waiting to be told.”*

















