create database library;

use library;

#creating table name as books
create table books(
id INT PRIMARY KEY auto_increment,
title VARCHAR(255),
author VARCHAR(100),
YEAR YEAR,
GENRE VARCHAR(100)
);

INSERT INTO books(title,author,year,genre) values
("The Great Gatsby","f.scott fitzgerald",1925,"fiction"),
("Pride and Prejudice","jane austen",1936,"romance"),
("To kill a mockingbird","harper lec",1960,"fiction"),
("1984","george orwell",1946,"dystopian"),
("moby dick","herman melville",1926,"adventure");

select* from books WHERE title like"t%";

select* from books WHERE author like "%son";

select* from books where title like "%and%";

select* from books where title like "%bird";

select* from books where title regexp "[A-Z]e | [A-Z]e | [A-Z]e";

SELECT * from books WHERE Title regexp "[0-9]";

select* from books WHERE  Title regexp "^[A-J]";

SELECT* FROM books where genre regexp "fiction|adventure";

select* from books WHERE  Title regexp "[A-J]";

select* from books WHERE YEAR LIKE "19%" and year>1950;

select* from books WHERE author regexp "[A-Z]e | [A-Z]e";

select* from books WHERE title regexp "^p" AND Title regexp "[A-Z]e | [A-Z]e";










