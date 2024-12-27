create database self_join;

use self_join;

create table Employee(
ID int,
Name varchar(30),
Manager_ID int
);

Insert into Employee values
(101,"Adam",103),
(102,"Bob",104),
(103,"Casey",null),
(104,"Donald",103);

Select * from Employee;

Select *
from Employee a
left join Employee b
on a.ID=b.ID;  

Select a.name,b.name
from Employee a
left join Employee b
on a.Manager_ID=b.ID; 

create table  student(
stu_ID int,
name varchar(30)
);

insert into student values
(101,"adam"),
(102,"bob"),
(103,"casey");

create table course(
stu_ID int,
course varchar(30)
);

insert into course values
(102,"eng"),
(105,"maths"),
(103,"science"),
(107,"CS");

select * from student;
select * from course;

# Left exclusive join
select s.stu_ID, s.name
from student s
left join course c
on s.stu_ID=c.stu_ID
where c.stu_ID is NULL;

# Right Exclusive join
select c.stu_ID, c.course
from student s
right join course c
on s.stu_ID=c.stu_ID
where s.stu_ID is NULL;

create table employees
(emp_id int,
Name varchar(30),
Dept_ID int,
Salary int,
Age int,
City int
);


insert into employees(emp_id,Name,Dept_ID,Salary,Age,City)
values(1,"Alice",101,50000,28,"New York"),
(2,"Bob",102,55000,35,"Chicago"),
(3,"Charlie",101,60000,38,"Los Angeles"),
(4,"David",103,45000,25,"New York"),
(5,"Eve",104,70000,45,"San Diego");



drop table employees;

create table employees
(emp_id int,
Name varchar(30),
Dept_ID int,
Salary int,
Age int,
City varchar(30)
);

insert into employees(emp_id,Name,Dept_ID,Salary,Age,City)
values(1,"Alice",101,50000,28,"New York"),
(2,"Bob",102,55000,35,"Chicago"),
(3,"Charlie",101,60000,38,"Los Angeles"),
(4,"David",103,45000,25,"New York"),
(5,"Eve",104,70000,45,"San Diego");

select * from employees;

#  1. Find pairs of employees who work in same department 
select e.name , f.name , f.dept_id 
from employees e 
join employees f 
on e.dept_id = f.dept_id
and e.emp_id  < f.emp_id;

# 2. Find employees who earn more than at least one other in the same department 
select f.name , e.salary , e.dept_id
from employees f
join employees e
on f.dept_id = e.dept_id
and f.salary > e.salary;

# 3. List employees who live in same city as another employee
select f.name , e.name , e.city
from employees f
join employees e
on f.city = e.city
and f.emp_id < e.emp_id;

create table departments(
Dept_ID int,
Dept_name varchar(30)
);

insert  into departments values
(101,"HR"),
(102,"Sales"),
(103,"IT"),
(104,"Finance");

select *from departments ;

### SUB QUERIES

#01- find the highest salary in employees table.
select max(salary) from employees;

#02- get names of employees who work in the same city as "Alice".
Select name from employees
where city=(Select City from employees where name = "Alice");

#03- List all employees who earn more than avg salary of the employees table.
Select name
from employees
where salary>(Select AVG(salary) from employees);

#04- Retrieve name of employees who age is below than the avg age.
select name from employees
where age<(Select Avg(age) from employees);

#05- Get the name of the department with lowest paid employees
Select d.Dept_name,e.salary
from departments d
join employees e
on d.Dept_ID=e.Dept_ID
order by  e.salary Asc
limit 1;

Select d.Dept_name,e.salary
from departments d
join employees e
on d.Dept_ID=e.Dept_ID
where salary=(Select min(salary)from employees);

Select Dept_name from departments
where Dept_ID = (select Dept_ID from employees 
where salary=(Select min(salary)from employees));

Select Dept_name from departments
where Dept_ID = (select Dept_ID from employees 
order by salary asc limit 1);

#06- Find all the emplpoyees who belong to a department where the avg salary is more than 60000.
Select name 
from employees
where Dept_ID  in 
(Select Dept_ID 
from employees
group by Dept_ID
having avg(salary)>60000);

#07- List the names of employee who earn the min salary in thier respective departments.
select name from employees
where salary in(
select min(salary) from employees
group by Dept_ID
having min(salary));

select name from employees
where Dept_ID = (
select Dept_ID from employees
group by Dept_ID
having salary=min(salary));


#08- Find employees who are older than the average age of employees in thier department.

Select name 
from employees 
where Age in
(Select avg(Age) 
from employees
group by Dept_ID);

#09-Find the names of employees who earn less than Bob
select name
from employees where salary <
( Select salary 
from employees where 
name = "Bob");

#10- Get the name of employees who work in departments with 2 employees;
Select name 
from employees where Dept_ID=(
Select Dept_ID from employees
group by Dept_ID
having count(name)=2);

#14- List the names of employees who are younger than all the employees in IT Department
insert into employees values
(6,"John",103,95000,21,"Japan"),
(7,"Eva",103,80000,20,"China");
Select * from employees;

Select name 
from employees 
where Age=
(Select min(Age)
from employees 
where Dept_ID in
(Select Dept_ID 
from Departments
where Dept_name="IT"));

#13- Find the departments with at atleast one employees earning more than 55000
Select name 
from employees 
where Dept_ID in
(Select Dept_ID
from employees
group by Dept_ID
having salary>55000 
);

#12- Get the names of employees who live in the same city as the highest paid employees
select name
from employees 
where salary in 
(Select salary
from employees 
where City="New York");

#11- Find departments with no employee older than 30 years.
Select Dept_name
from departments
where Dept_ID in
(Select Dept_ID
from employees 
where Age>30
);

Select * from employees;








