-- VIEWS AND MODES

show databases;
use tv_db;
show tables;

-- Listing all the data in the tables
select * from reviewers;
select * from reviews;
select * from series;

-- Inner Join
select * from reviews join series on series.id = reviews.series_id
                      join reviewers on reviewers.id = reviews.reviewer_id;
select title,released_year,genre,rating,first_name,last_name from reviews 
					  join series on series.id = reviews.series_id
                      join reviewers on reviewers.id = reviews.reviewer_id;                      

-- Working with VIEWS
create view  full_reviews as
select title,released_year,genre,rating,first_name,last_name from reviews 
					  join series on series.id = reviews.series_id
                      join reviewers on reviewers.id = reviews.reviewer_id; 
-- A virtual table full_reviews is created                      
show tables; 
select * from full_reviews;
select title,genre,round(avg(rating),2) as avg_rating from full_reviews group by title,genre order by avg_rating; -- non updateable or inserteable because it contains aggregate functions
-- Updateable/insertable view
create view order_series as select * from series;
select * from order_series;
select title,genre,released_year from order_series;
insert into order_series(title,genre,released_year) values ('The Brave','Animation',2022);
create or replace view order_series as select title,genre,released_year from series order by released_year desc;
alter view order_series as select title,genre,released_year from series order by released_year;
drop view order_series; -- We can drop a view

-- working with HAVING clause
select title,rating,round(avg(rating),2) as review_count from full_reviews group by title,rating;
select title,rating,count(rating) as rating_count,round(avg(rating),2) as review_count from full_reviews group by title,rating;
select title,rating,count(rating) as rating_count,round(avg(rating),2) as review_count from full_reviews group by title,rating having count(rating) > 1;

-- working with WITH ROLLUP
select title,round(avg(rating),1) as avg_rating from full_reviews group by title with rollup;
select title,count(rating) as avg_rating from full_reviews group by title with rollup;
select first_name,released_year,genre,avg(rating) as avg_rating from full_reviews group by released_year,genre,first_name with rollup;

                  
                      
