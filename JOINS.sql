create database empdata;
 use empdata;
 
 create table employees(
 emp_id int,
 emp_name varchar(30),
 department_id int
 );
 
 Insert into employees values
 (1,"Alice",10),
 (2,"Bob",20),
 (3,"Charlie",30),
 (4,"David",10),
 (5,"Eve",40);
 
 create table departments (
 department_id int,
 department_name varchar(30)
 );
 
 
 insert into departments values
 (10,"HR"),
 (20,"Finance"),
 (30,"IT"),
 (40,"Admin"),
 (50,"Marketing");
 
 create table projects(
 project_id int,
 emp_id int,
 project_name varchar(30)
 );
 
 insert into projects values
 (101,1,"Alpha"),
 (102,2,"Beta"),
 (103,3,"Gamma"),
 (104,4,"Delta");
 
 # Q1- Query to get Employee and Department details using join. 
 Select  e.emp_id,e.emp_name,d.department_id,d.department_name
 from employees e
 left join departments d
 on e.department_id=d.department_id;
 
 # Q2- Query to retrieve all employees with their departments, even if the department is missing.
 Select e.emp_id,e.emp_name,d.department_name
 from employees e
 right join departments d
  on e.department_id=d.department_id;
  
# Q3- Query to get department details even if there are no employees in that department. 
Select d.department_id,d.department_name,e.emp_name
from departments d
left join employees e
on e.department_id=d.department_id;

# Q4- Query to get all employees and departments, whether matched or not. 
Select e.emp_name,d.department_name 
from employees e
inner join departments d
on e.department_id=d.department_id;

# Q5- JOIN three tables (Employees, Departments, Projects) to get employee, department, and project information. 
Select e.emp_name,d.department_name,p.project_name
from employees e
left join departments d
on e.department_id=d.department_id
left join projects p
on e.emp_id=p.emp_id;

# Q6- Find employees who are not assigned to any projects
Select e.emp_name,p.project_name
from employees e
left join projects p
on e.emp_id=p.emp_id
where e.emp_id=5;

# Q7- Find departments with no employees using a RIGHT JOIN. 
Select d.department_name,e.emp_name
from employees e
right join departments d
on e.department_id=d.department_id
where d.department_id=50;

# Q8- Query to get Employee and Department details using join with aliases.  
select e.emp_id, e.emp_name,d.department_id,d.department_name
from employees e
right join departments d
on e.department_id=d.department_id;

# Q9- Query to find employees in the same department as other employees
Select e.emp_name,d.department_name
from employees e
join departments d
on e.department_id=d.department_id
where d.department_name="HR";


# Q10- Query to find projects managed by employees in the 'IT' department. 
Select e.emp_name,d.department_name,p.project_name
from employees e
join departments d 
on e.department_id=d.department_id
join projects p 
on e.emp_id=p.emp_id
where d.department_name="IT";

# Q11- Query to show employees and their project information (even if not assigned to a project).
Select e.emp_name,p.project_name
from employees e 
left join projects p 
on e.emp_id=p.emp_id;

# Q12- Find employees who work in departments with names starting with 'A'. 
Select e.emp_name,d.department_name
from employees e 
join departments d 
on e.department_id=d.department_id
where d.department_name like "A%";

# Q13- Find the total number of employees in each department using GROUP BY and JOIN.
Select count(e.emp_id) AS "total no. of employees",d.department_name
from employees e 
join departments d 
on e.department_id=d.department_id
group by department_name ; 

# Q14- Get the list of departments with more than one employee
Select count(e.emp_id) AS "no. of employees",d.department_name
from employees e 
join departments d 
on e.department_id=d.department_id
group by department_name 
limit 1;

