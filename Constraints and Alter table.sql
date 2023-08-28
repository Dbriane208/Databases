-- working with CONSTRAINTS AND ALTER TABLE
use classWork;


-- working with UNIQUE Constraints
create table contacts (name varchar(100) not null,
phone varchar(15) not null unique);
insert into contacts(name,phone) values('Lamb','12345');
-- it will result into an error because of phone duplicate
insert into contacts(name,phone) values('Ling','12345');

-- working with CHECK Constraints
create table palindrome(word varchar(100) check (reverse(word) = word));
-- one row will be affected because racecar  is a palindrome 
insert into palindrome(word) values('racecar');
-- it will result into an error
insert into palindrome(word) values ('cap');
create table person(age int check (age > 18));
insert into person(age) values(19);
-- 9 is less than 18 hence will result into an error
insert into person(age) values(9);

-- working with NAMED Constraints
create table users(age int,
constraint under_18_years check (age > 18));
insert into users(age) values(9); -- error age is below 18

-- working with multiple column  Constraints
create table houses(purchase_price int not null, sale_price int not null,
 constraint sprice_gt_bprice check(sale_price >= purchase_price));
 insert into houses(purchase_price,sale_price) values (100,300);
  insert into houses(purchase_price,sale_price) values (400,300); -- error saleprice > purchaseprice constraint
  
create table companies(name varchar(255) not null,address varchar(255) not null,
 constraint name_address unique(name,address));
insert into companies(name,address) values('Amazon','12 SF');
insert into companies(name,address) values('Google','12 SF');
select * from companies;
insert into companies(name,address) values('Google','12 SF');-- error duplicates name and address
    

-- working with ALTER TABLE : Adding colums
alter table users add column name varchar(100);
desc users;
select * from users;
insert into users(name,age) values('jaymie',90);
alter table companies add column phone varchar(15) default 'xyz';
select * from companies;

-- working with ALTER TABLE : Dropping colums
alter table users drop column name;
alter table companies drop column phone;

-- working with ALTER TABLE : Renaming colums
rename table users to users_age;
select * from users; -- error no table called users
select * from users_age;
alter table companies rename to it_industry;
select * from companies; -- error no table called companies
select * from it_industry;
-- renaming colums in a table
alter table it_industry rename column name to company_name;
rename table it_industry to companies;
desc companies;

-- working with ALTER TABLE : Modifying columns
alter table companies modify company_name varchar(100) default 'unknown';
insert into companies (address) values ('789 Tx');
select * from companies;

-- working with ALTER TABLE : Constraints
desc houses;
alter table houses add constraint positive_pprice check (purchase_price >= 0);
insert into houses (purchase_price,sale_price) values (-1,5); -- cannot take a -ve purchase price

alter table users_age drop constraint under_18_years;
insert into users_age (age) values (9);






    
    
    
  
 

 