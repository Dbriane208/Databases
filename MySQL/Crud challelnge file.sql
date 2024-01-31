create database shirts_db;
use shirts_db;
create table shirts(shirt_id int primary key auto_increment,
aritcle varchar(100) not null,color varchar(100) not null,shirt_size varchar(100) not null,last_worn int not null);
insert into shirts(aritcle,color,shirt_size,last_worn)values('t-shirt','white','S',10),
('t-shirt','green','S',200),
('polo shirt','black','M',10),
('tank top','blue','S',50),
('t-shirt','pink','S',0),
('polo shirt','red','M',5),
('tank top','white','S',200),
('tank top','blue','M',15);
select * from shirts;
update shirts set shirt_id = 1  where shirt_id = 17;
update shirts set shirt_id = 2  where shirt_id = 18;
update shirts set shirt_id = 3  where shirt_id = 19;
update shirts set shirt_id = 4  where shirt_id = 20;
update shirts set shirt_id = 5  where shirt_id = 21;
update shirts set shirt_id = 6  where shirt_id = 22;
update shirts set shirt_id = 7  where shirt_id = 23;
update shirts set shirt_id = 9  where shirt_id = 25;
insert into shirts(aritcle,color,shirt_size,last_worn)values('polo shirt','purple','M',50);
select aritcle,color from shirts;
select aritcle,color,shirt_size,last_worn from shirts where shirt_size = 'M';
update shirts set shirt_size = 'L' where aritcle = 'polo shirt';
update shirts set last_worn = 0 where last_worn = 15;
update shirts set shirt_size = 'XS',color = 'off white' where color = 'white';
delete from shirts where last_worn = 200;
delete from shirts where aritcle = 'tank top';
delete from shirts;
drop table shirts;
show tables;

