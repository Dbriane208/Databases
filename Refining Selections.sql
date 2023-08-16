-- SECTION 9 REFINING SELECTIONS
select database();
use book_shop;
desc books;

-- Adding some new books to the database
INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);

-- Working with DISTINCT
select distinct title from books;
select distinct author_fname,author_lname from books;
select distinct released_year from books;

-- Working with ORDER BY
select title from books order by title asc;
select title,author_fname,pages from books order by pages desc;
select title,stock_quantity from books order by 2;

-- Working with LIMIT
select distinct author_lname from books limit 5;
select stock_quantity,pages from books limit 0,10;
select distinct title from books limit 15;

-- Working with LIKE
select title,author_fname from books where author_fname like '%da%';
select title,author_lname from books where author_lname like '% %';
select title from books where title like '%stories%';
select author_lname from books where author_fname like '_a_';

-- SECTION 9 REFINING SELECTIONS SOLUTIONS
select title, pages from books order by pages desc limit 1;
select concat(title,' - ',released_year) as summary from books order by released_year desc limit 4;
select title,released_year,stock_quantity from books order by stock_quantity asc limit 3;
select title, author_lname from books order by author_lname,title;
select concat('MY FAVORITE AUTHOR IS ',concat(author_lname,' ',author_fname),' !') as yell from books order by author_lname;


