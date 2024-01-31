-- RIVISTING DATATYPES SECTION
select database();
show databases;
use classWork;
show tables;

desc people;
drop table people;

desc table Employees;
drop table Employees;

desc table cats;
drop table cats;

-- working with date,time and datetime
create table people(person_id tinyint primary key auto_increment,
fullname varchar(50) not null,
dateOfBirth date,
timeOfBirth time,
birthday datetime);
desc people;
insert into people(fullname,dateOfBirth,timeOfBirth,birthday) 
value('Eddy Wild','1915-08-17','12:00:00','1915-08-17 12:00:00'),
('Richard Feynman','1903-01-30','18:40:05','1903-01-30 18:40:05'),
('Ludwig krapf','1895-12-10','04:45:55','1940-11-25 19:30:25'),
('Fred Kissinger','1940-11-25','19:30:25','1940-11-25 19:30:25'),
('John Doe','1900-01-15','9:00:45','1900-01-15 9:00:45');
select * from people;

-- working with curdate,curtime and now
insert into people(fullname,dateOfBirth,timeOfBirth,birthday) 
value('Ricco Peng',curdate(),curtime(),now());
select * from people;

-- working with date functions
select fullname,monthname(dateOfBirth) as month,dayofmonth(dateOfBirth) as day,year(dateOfBirth) as year from people;
select fullname,monthname(dateOfBirth) as month,dayname(dateOfBirth) as day from people;
select fullname,monthname(dateOfBirth) as month,dayname(dateOfBirth)as day,dayofyear(dateOfBirth) as yearday from people;

-- working with time functions
select fullname,hour(timeOfBirth)as time from people;
select fullname,hour(timeOfBirth) as hour,minute(timeOfBirth) as minute,second(timeOfBirth) as second from people;

-- working with formatting dates
select dateOfBirth,date_format(dateOfBirth, '%a %b %D')as date from people;
select birthday,date_format(birthday,'%H:%i') from people;
select date_format(birthday,'Born on %r') as birthday from people;

-- SOLUTION CODE
-- What's a good use case for CHAR?
 
-- Used for text that we know has a fixed length, e.g., State abbreviations, 
-- abbreviated company names, etc.
 
CREATE TABLE inventory (
    item_name VARCHAR(100),
    price DECIMAL(8,2),
    quantity INT
);
 
-- What's the difference between DATETIME and TIMESTAMP?
 
-- They both store datetime information, but there's a difference in the range, 
-- TIMESTAMP has a smaller range. TIMESTAMP also takes up less space. 
-- TIMESTAMP is used for things like meta-data about when something is created
-- or updated.
 
 
SELECT CURTIME();
 
SELECT CURDATE();
 
SELECT DAYOFWEEK(CURDATE());
SELECT DAYOFWEEK(NOW());
SELECT DATE_FORMAT(NOW(), '%w') + 1;
 
SELECT DAYNAME(NOW());
SELECT DATE_FORMAT(NOW(), '%W');
 
SELECT DATE_FORMAT(CURDATE(), '%m/%d/%Y');
 
SELECT DATE_FORMAT(NOW(), '%M %D at %h:%i');
 
CREATE TABLE tweets(
    content VARCHAR(140),
    username VARCHAR(20),
    created_at TIMESTAMP DEFAULT NOW()
);
 
INSERT INTO tweets (content, username) VALUES('this is my first tweet', 'coltscat');
SELECT * FROM tweets;
 
INSERT INTO tweets (content, username) VALUES('this is my second tweet', 'coltscat');
SELECT * FROM tweets;








