### SUBQUERIES BY- Tushti Gupta, SODS

create database subquery;
use subquery;
Select * from Employees;
Select * from Departments;

#Q1-Find employees with salaries greater than the average salary of all employees. 
Select Name,Salary 
from Employees
where Salary >
(Select avg(Salary) 
from Employees
);

#Q2- Find employees whose salary is higher than the salary of 'Alice'. 
Select Name, Salary
from Employees
where Salary>
(Select Salary 
from Employees
Where Name="Alice");

#Q3- List employees who belong to a department that has the name 'IT'. 
Select Name , Department
from Employees 
where Department in
(Select Department
from Employees
Where Department="IT");

#Q4- Get the names of employees who earn the highest salary in their department. 
Select Name,Department, Salary
from Employees 
Where Salary in
(Select max(Salary)
from Employees
Group by Department);

#Q5-Retrieve the departments where at least one employee earns more than 7000. 
Select Name, Department,Salary
from Employees
Where Salary in
(Select Salary
from Employees 
where Salary>7000 
);

#Q6- List employees who do not belong to any department in the departments table.
Select Name 
from Employees
Where Department=
(Select Dept_Name
from Departments
where Dept_ID=Null);

#Q7- Find the second-highest salary among employees. 
Select Name, Salary
from Employees
Where Salary =
(Select Salary 
from Employees
Order by Salary DESC limit 1,1 );

#Q8- Retrieve the names of employees who work in the department with the highest number of employees. 
select Name,Department
from Employees
where Department in  (
select Department 
from Employees
group by department having count(*) = (
select count(*) 
from Employees 
group by department order by count(*) desc limit 1));

 #Q9- Find employees who earn more than the average salary in their department. 
Select Name,Department,Salary
from Employees
where Salary>
(Select Avg(Salary)
from Employees);

#Q10- Retrieve employees whose salary is above 7000 and belong to departments in the departments table. 
Select Name ,Department
from Employees
Where Salary in
(Select Salary
from Employees
where Salary>7000);

#Q11- List all departments that have no employees. 
Select Department
from Employees
Where Name=
(Select Name 
from Employees 
Where Name=Null);

#Q12- Find employees who have the same salary as another employee in a different department. 
Select Name 
from Employees
where Salary in
(Select distinct Department
from Employees);

#Q13- Get the total salary of the department with the maximum total salary. 
Select sum(Salary)
from Employees
where Department=
(Select Department
from Employees
group by Department
order by sum(Salary) desc 
limit 1
);

#Q14- Retrieve employees whose department has more than two employees.
Select Name 
from Employees
where Department in
(Select Department
from Employees
group by Department 
having count(Name)>2);

#Q15- Find the employees whose salary is higher than the average salary of employees in the IT department. 
Select Name,Department,Salary
from Employees
Where Salary>
(Select Avg(Salary)
from Employees
where Department="IT");








