-- subqueries
CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);
INSERT INTO department (dept_id, dept_name, location) VALUES
(101, 'HR', 'Hyderabad'),
(102, 'Sales', 'Bangalore'),
(103, 'IT', 'Hyderabad'),
(104, 'Finance', 'Chennai'),
(105, 'Marketing', 'Mumbai'),
(106, 'Admin', 'Delhi'),
(107, 'R&D', 'Pune'),
(108, 'Support', 'Hyderabad');
update employees set department=dept_id;
SELECT * FROM keerthi.employees;
select emp_name from employees
where salary<(select avg(salary) from employees);
select emp_name from employees where salary>(select max(salary) from employees);
select max(salary) as sec_highest_sal from employees where salary<(select max(salary) from employees);-- second higest salary
select emp_name from employees where department=(select department from  employees where emp_name='john');
select emp_name from employees where salary=(select min(salary) from employees);
select emp_name from employees where department in (select dept_id from department where location = 'hyderabad');

-- Find employees who earn more than the average salary.
select *from employees where salary>(select avg(salary)from employees);
-- Find employees who earn less than the average salary.
select *from employees where salary<(select avg(salary)from employees);
-- Find the employee(s) with the highest salary.
select *from employees where salary>(select max(salary)from employees);
-- Find the employee(s) with the lowest salary.
select *from employees where salary<(select min(salary)from employees);
-- Find employees hired after the latest HR employee.
select * from employees where join_date>(select max(join_date) from employees where department='hr');
-- Find employees hired before the earliest Engineer .
select *from employees where join_date>(select min(join_date) from employees);
-- Find employees earning more than the highest HR salary.
select*from employees where salary>(select max(salary)from employees where department ='hr');
-- Find employees earning less than the lowest Marketing salary.
select *from employees where salary<(select min(salary) from employees where department='marketing');
-- Find employees earning more than David.
select *from employees where salary>(select salary from employees where emp_name='david');
-- 10. Find employees hired before Anurag.
select *from employees where join_date<(select join_date from employees where emp_name='anurag');
-- 11. Find employees who work in the same role as Amanda.
select *from employees where department=(select department from employees where emp_name='amanda');
-- second highest salary
select max(salary)as sec_hig_sal from employees where salary<(select max(salary) from employees); 
-- select the employees who earn the higest salary in each department
select department,max(salary)from employees group by department;
-- (or)-- 
select *from employees where(department,salary) in(select department,max(salary)from employees group by department);
-- select departments who do not have employees
select dept_id from department where dept_id  not in(select dept_id from employees);
-- find the employees whose salary more than any employee in sales department
select *from employees where salary>any(select emp_name from employees where department='sales');
-- find employees whose salary is greater than all employees except themselves
select *from employees where salary>(select max(salary) from employees);
-- find the employees whose salary more thann all hr employees more than any sales employee
select *from employees where salary>all(select salary from employees where department='hr')and salary>any
(select salary from employees where department='sales');
-- Find employees whose salary is less than all Engineers but greater than any Marketing employee
select *from employees where salary<all(select salary from employees where department='engineers')and
salary>any(select salary from employees where department='marketing');
-- Find employees who joined after all HR employees but before any Sales employee.
select *from employees where join_date>all(select join_date from employees where department='hr')and 
join_date<any(select join_date from employees where department='sales');
-- Find employees who work in departments where at least one employee earns more than 70,000.
select *from employees where department in(select department from employees group by department
 having max(salary)<=70000);
 
 -- second higest salary
 select *from(
 select employee_id,salary,
 dense_rank() over(order by salary desc) as rnk
 from employees)as x 
 where rnk=2;
 


-- Level 1: Single-Row Subqueries (Easy)

-- Use operators like =, >, <, >=, <=.

-- Find employees whose salary is greater than the average salary.
select *from employees where salary>(select avg(salary)  from employees);

-- Find employees whose salary is less than the average salary.
select * from employees where salary<(select avg(salary) from employees);
-- Find the employee(s) earning the highest salary.
select * from employees where salary=(select max(salary) from employees);
-- Find the employee(s) earning the lowest salary.
select * from employees where salary=(select min(salary) from employees);
-- Find employees hired after the latest hire date in the Sales department.
select * from employees where join_date>(select max(join_date) from employees where department='sales');
-- Find products priced above the average product price.
select product_name from products where price>(select avg(price) from employees);
-- Find customers older than the average customer age.
select customer_name, age from employees where age>(select avg(age) from employees);
-- Find employees earning more than the minimum salary.
select emp_name from employees where salary>(select min(salary) from employees);
-- Find products priced below the maximum product price.
select product_name from employees where price<(select max(salary) from employees); 
-- Find employees hired before the average hire date.
select * from employees where join_date<(select avg(join_date) from employees);
-- Level 2: Multi-Row Subqueries ( IN, ANY, ALL) (Easy–Medium)
-- Find employees working in departments that have more than 5 employees.
select * from employees where department in(select department from department group by department having count(*)>5);
-- Find customers from states where more than 10 customers live.
select * from employees where state in(select state from employees group by state having count(*)>10); 
-- Find employees belonging to departments located in New York.
select * from employees where department in(select department from employees where location ='new york');
-- Find products ordered by customers from California.
select product_name from products where product_id in(select product_id from orders where customer_id in(select customer_id from  customers
where location='california'));
-- Find employees working in departments with an average salary above £60,000.
select * from  employees where department in(select department from  employees group by department having avg(salary)>60000);
-- Find customers who have placed at least one order.
select customer_name from customers where customer_id in(select customer_id from orders where order_id>=1);
-- Find products that have never been ordered.
select prpduct_name from products where product_id not in(select product_id from orders );
-- Find employees whose job title exists in the HR department.
select emp_name from employees where role in(select role from employees where department='hr');
-- Find departments having at least one employee earning more than £80,000.
select distinct department from employees where employee_id  in (select employee_id from employees where salary>80000); 
-- Find employees working in departments with the highest average salary.
select emp_name from employees 
where department in(select department  from employees group by department having avg(salary)=
(select max(avg_salary) from (select avg(salary)as avg_salary from employees)) );
-- Level 3: Correlated Subqueries (Medium)
-- Find employees earning more than the average salary of their own department.
select *from employees e1 where salary >(select avg(salary)as avg_sal from employees e2 where e1.department=e2.department );
-- Find the highest-paid employee in each department.
select emp_name,department from employees e1 where salary =(select max(salary) from employees e2 where e1.department=e2.department); 
-- Find the lowest-paid employee in each department.
select emp_name,department from employees e1 where salary=(select min(salary) from employees e2 where e1.department-e2.department);
-- Find employees whose salary is above every employee in another department.
select emp_name ,department,salary from employees e1 where salary> all(select salary from employees e2 where e1.department=e2.department ); 
-- Find customers who placed more orders than the average customer.




-- Find all employees whose salary is greater than the average salary of the company.
select emp_name from employees where salary >(select avg(salary) from employees);
-- Retrieve the details of the employee(s) who receive the highest salary in the company.
select emp_name,salary from employees where salary=(select max(salary) from employees);
-- Find all products whose price is higher than the average price of all products.
select product_name from products where price >(select avg(price) from products);
-- Display the students who scored more than the average marks in the class.
select students_name from students where marks>(select avg(marks) from students);
-- Find the orders whose total amount is greater than the average order amount.
select order_id from orders where amount> (select avg(amount) from orders));
-- Retrieve the employees whose experience is greater than the average experience of all employees.
select *from employees where experience>(select avg(experience) from employees);
-- Find the customers whose total purchase amount is greater than the average purchase amount of all customers.
select customer_name from employees where customer_id in(select customer_id,sum(amount)as sum_amount from purchase group by customer_id
having sum_amount>(select avg(amount) from purchase));
-- Display the departments whose average employee salary is greater than the overall average salary of the company.
select department ,avg(salary) as avg_sal from employees group by department having avg_sal>(select avg(salary) from employees);





































