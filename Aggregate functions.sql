-- AGGREGATE FUNCTIONS

-- Database we'are using
use book_shop;
select * from books;

-- Working with COUNT
select count(*) from books;
select count(distinct concat(author_fname,' ',author_lname)) as fullname from books;
select count(released_year) from books;

-- Working with GROUP_BY
select released_year, count(*) from books group by released_year order by count(*) desc;
select distinct concat(author_fname,' ',author_lname),count(title) as author_books from books group by concat(author_fname,' ',author_lname) order by count(title);
select title,author_lname, count(*) as books_written from books group by title,author_lname order by author_lname desc;

-- Working with MIN and MAX
select min(pages) from books;
select max(stock_quantity) from books;
select min(author_fname),max(author_lname) from books;

-- Working with SUBQUERIES
select title,pages from books where pages = (select max(pages) from books);
select title,released_year from books where released_year = (select min(released_year) from books);
select title,stock_quantity from books where stock_quantity = (select max(stock_quantity) from books);

-- Working with GROUPING BY MULTIPLE COLUMNS
select title,author_lname, count(*) as books_written from books group by title,author_lname order by author_lname desc;
select title,concat(author_fname,' ',author_lname) as author,count(*) from books group by title,author order by author;
select distinct concat(author_fname,' ',author_lname) as author,count(*) from books group by author order by count(*) desc limit 5;

-- Working with MAX AND MIN WITH GROUP BY
select concat(author_fname,' ',author_lname) as author,max(released_year)  as latest_book,min(pages) as least_pages from books group by author order by least_pages;
select title,max(pages) as longest_book,max(released_year) as latest_release,min(released_year) as earliest_release from books group by title order by longest_book desc;
select title,max(pages) as longest_book from books group by title order by longest_book desc;

-- Working with SUM
select sum(stock_quantity) as stock from books;
select author_fname,sum(stock_quantity) as stock from books group by author_fname ;
select title,sum(stock_quantity) as stock from books group by title order by stock desc;
select avg(released_year) as average from books;

-- Working with AVERAGE
select avg(stock_quantity) as stock from books;
select author_fname,avg(stock_quantity) as stock from books group by author_fname ;
select title,sum(stock_quantity) as total_stock,avg(stock_quantity) as average_stock from books group by title order by total_stock desc;

-- AGGREGATE FUNCTIONS EXERCISE SOLUTION CODE
select count(*) from books;
select released_year,count(*) from books group by released_year order by released_year;
select concat(author_fname,' ',author_lname)as author,avg(stock_quantity) as stock from books group by author;
select concat(author_fname,' ',author_lname)as author,pages from books where pages = (select max(pages) from books);
select released_year,count(*) as '# books', avg(pages) as 'average pages' from books group by released_year order by released_year;

