create database conditions;
use conditions;  
select * from empdata;

### IF/ESLE

#Q1- Write a query to calculate a 10% bonus if the salary is greater than or equal to 60000.Otherwise calculate a 5% bonus. Display emp_id,name and the calculated bonus
Select Emp_id,Name,
IF (salary>=60000,salary*0.10,salary*0.05) As Bonus
from empdata;

#Q2- Write a query to display emp_id,name and a status of "High Earner" or "Average Earner" for employees in the IT department, depending on whether their salary exceeds 75000
Select Emp_id,Name,
IF(salary>75000,"High Earner","Average Earner") AS Earners
from empdata
where department="IT";

#Q3- WRITE A QUERY TO CLASSIFY EMPLOYEE AS EXPERIENCED IF THEIR JOINING YEAR IS BEFORE 2020 AND NEWCOMES OTHERWISE DISPLAY EMP_ID,NAMME AND THE CATEGORY
Select Emp_id, Name,
IF(joining_year<2020,"Experienced","New Comer")
from empdata;

#Q4- Write a query to mark employees as "Eligible for promotion if they are in IT department and their salary is greater than 70000. Mark other as "Not Eligible"
Select Emp_id,Name,
IF(salary>70000,"Eligible","Not Eligible") AS Eligible_Employees
from empdata
where department = "IT";

#Q5 Determine if employee id in the employees table is even or-odd
select Emp_id, Name,
case
when Emp_id%2=0 then "Even"
when Emp_id%2!=0 then "Odd"
end as "Even and odd"
from empdata;


#Q6- Check joining_year is a leap year or not.
Select Emp_id,Name,joining_year AS Year,
IF(joining_year%4=0 or joining_year%400=0, "Leap year","Not a leap year")
from empdata;
