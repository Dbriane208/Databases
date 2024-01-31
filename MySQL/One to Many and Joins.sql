-- ONE TO MANY AND JOINS

SELECT DATABASE();
SHOW DATABASES;

CREATE DATABASE shop;
USE shop;
SHOW DATABASES;

-- adding ON DELETE CASCADE
DROP TABLE orders;
DROP TABLE customers; 

CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50)
);
 
CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE
);
 
INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016-02-10', 99.99, 1),
       ('2017-11-11', 35.50, 1),
       ('2014-12-12', 800.67, 2),
       ('2015-01-03', 12.50, 2),
       ('1999-04-11', 450.25, 5);
       
SELECT * FROM customers;
SELECT * FROM orders;

-- performing a cross join
SELECT * FROM customers, orders;

-- working with INNER JOIN
SELECT * FROM customers JOIN orders ON customers.id = orders.customer_id;
SELECT first_name,last_name,order_date,amount FROM customers JOIN orders ON customers.id = orders.customer_id;  
SELECT first_name,last_name,SUM(amount)AS total FROM customers JOIN orders ON customers.id  = orders.customer_id GROUP BY first_name,last_name ORDER BY total; 
SELECT first_name,last_name,AVG(amount)AS total FROM customers JOIN orders ON customers.id  = orders.customer_id GROUP BY first_name,last_name ORDER BY total; 

-- working with LEFT JOIN
SELECT first_name,last_name,amount FROM customers LEFT JOIN orders ON customers.id = orders.customer_id;  
SELECT first_name,last_name,order_date,amount FROM orders LEFT JOIN customers ON customers.id = orders.customer_id; 
SELECT first_name,last_name,IFNULL(SUM(amount),0) AS money_spent FROM customers LEFT JOIN orders ON customers.id  = orders.customer_id GROUP BY first_name,last_name ORDER BY money_spent; 
SELECT first_name,last_name,AVG(amount)AS total FROM customers LEFT JOIN orders ON customers.id  = orders.customer_id GROUP BY first_name,last_name;

-- working with RIGHT JOIN
insert into orders(order_date,amount) values (curdate(),100);
select * from orders;

SELECT first_name,last_name,order_date,amount FROM customers RIGHT JOIN orders ON customers.id = orders.customer_id;  
SELECT first_name,last_name,order_date,amount FROM orders RIGHT JOIN customers ON customers.id = orders.customer_id; 

-- ONE TO MANY AND JOINS EXERCISE SOLUTION
create table student( id int primary key auto_increment,first_name varchar(50) not null);
create table papers (title varchar(250),grade int,student_id int,foreign key (student_id) references student(id) on delete cascade);

insert into student (first_name) values ('Caleb'),('Samantha'),('Raj'),('Carlos'),('Lisa');
insert into papers (student_id,title,grade) values ('1','My First Book Report',60),
('1','My Second Book Report',75),
('2','Russian Lit Through The Ages',94),
('2','De Montaigne and The Art Of The Essay',98),
('4','Borges and Magical Realism',89);

select * from student;
select * from papers;

select first_name,title,grade from student inner join papers on student.id = papers.student_id order by first_name desc;
select first_name,title,grade from student left join papers on student.id = papers.student_id ;
select first_name,ifnull(title,'MISSING'),ifnull(grade,0) from student left join papers on student.id = papers.student_id ;





 


