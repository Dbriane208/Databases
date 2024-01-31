-- WINDOW FUNCTIONS

show databases;
use classWork;
show tables;

-- Creating our working datasets
CREATE TABLE employees (
    emp_no INT PRIMARY KEY AUTO_INCREMENT,
    department VARCHAR(20),
    salary INT
);
INSERT INTO employees (department, salary) VALUES
('engineering', 80000),('engineering', 69000),('engineering', 70000),('engineering', 103000),('engineering', 67000),('engineering', 89000),('engineering', 91000),
('sales', 59000),('sales', 70000),('sales', 159000),('sales', 72000),('sales', 60000),('sales', 61000),('sales', 61000),('customer service', 38000),('customer service', 45000),
('customer service', 61000),('customer service', 40000),('customer service', 31000),('customer service', 56000),('customer service', 55000);

-- working with OVER()
select * from employees;
select emp_no,department,avg(salary) over() as avg_salary from employees;
select emp_no,department,round(avg(salary) over(),2) as avg_salary,min(salary) over() as min_salary ,max(salary) over() as max_salary from employees;

-- working with PARTITION BY 
select emp_no,department,avg(salary) over(partition by department) as avg_salary from employees;
select emp_no,department,sum(salary) over(partition by department) as avg_salary ,count(*) over() as dep_count from employees;
select emp_no,department,sum(salary) over(partition by department) as avg_salary ,count(*) over(partition by department) as dep_count from employees;

-- working with ORDER BY with windows
select emp_no,department,avg(salary) over(order by department desc) as avg_salary from employees;
select emp_no,department,salary,sum(salary) over(partition by department) as rolling,max(salary) over(order by salary ) as max_salary from employees; 
select emp_no,department,salary,sum(salary) over(partition by department order by salary) as rolling,sum(salary) over(partition by salary ) as max_salary from employees; 
select emp_no,department,salary,min(salary) over(partition by department order by salary desc) as rolling_min from employees; 

-- working with RANK(),DENSE_RANK() & ROW_NUMBER()
select emp_no,department,salary,row_number() over(partition by department) as dept_row_number from employees;
select emp_no,department,salary,rank() over(partition by department order by salary desc) as dept_row_number from employees;
select emp_no,department,salary,rank() over(order by salary desc) as overall_dense_rank from employees;
select emp_no,department,salary,row_number() over(order by salary desc) as overall_dense_rank from employees;
select emp_no,department,salary,dense_rank() over(order by salary desc) as overall_num from employees;
SELECT 
    emp_no, 
    department, 
    salary,
    ROW_NUMBER() OVER(PARTITION BY department ORDER BY SALARY DESC) as dept_row_number,
    RANK() OVER(PARTITION BY department ORDER BY SALARY DESC) as dept_salary_rank,
    RANK() OVER(ORDER BY salary DESC) as overall_rank,
    DENSE_RANK() OVER(ORDER BY salary DESC) as overall_dense_rank,
    ROW_NUMBER() OVER(ORDER BY salary DESC) as overall_num
FROM employees ORDER BY overall_rank;

-- working with NTILE()
select emp_no,department,salary, ntile(4)  over(order by salary desc) as salary_quartile from employees;
select emp_no,department,salary, ntile(2)  over(partition by department order by salary desc) as salary_quartile from employees;

-- working with FIRST_VALUE()
select emp_no,department,salary, first_value(emp_no) over(order by salary desc) as highest_paid_dept from employees;
select emp_no,department,salary, first_value(emp_no) over(partition by department order by salary desc) as salary_quartile from employees;
select emp_no,department,salary, first_value(emp_no) over(partition by salary order by salary desc) as highest_paid_overall,
first_value(emp_no) over(order by salary desc) as highest_paid_dept  from employees;

-- working with LEAD and LAG
select emp_no,department,salary, salary - lead(salary) over(order by salary desc) as highest_paid_dept from employees;
select emp_no,department,salary, salary - lag(salary) over(partition by department order by salary desc) as highest_paid_dept from employees;



