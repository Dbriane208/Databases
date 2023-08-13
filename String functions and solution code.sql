-- STRING FUNCTIONS

select database();
create database book_shop;
use book_shop;
CREATE TABLE books 	(
		book_id INT AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id));
INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);
select * from books;

-- Using CONCAT and CONCAT_WS
-- We are using empty string to separate the two columns and alias to temporarily hold the name of the created column
select concat(title,'',released_year) as book_release_year from books;
select concat_ws('-',author_fname,author_lname) as author_fullname from books;

-- Working with SUBSTRING
select substr(title,1,10),author_fname from books;
select substr(author_lname,-5) as five_last_characters,author_lname from books;

-- Combining string functions
select concat(substring(title,1,10),'...') as short_list from books;
select concat(substring(title,1,10))as short_list,concat(author_fname,' ',author_lname) as author_name from books;

-- Working with REPLACE
select replace('Daniel','Da','Pe');
select replace(title,' ','-') from books;

-- Working with REVERSE
select reverse('Elon');
select concat(author_fname,reverse(author_lname)) as reverse_name from books;

-- Working with CHAR_LENGTH
select character_length('Daniel Brian Gatuhu Nyambura') as name;
select character_length(title) as len_title,title from books;

-- Working with UPPER(UCASE) AND LOWERCASE(LCASE) 
select ucase('just kids');
select ucase(title) as upper_title from books;
select concat('I love ',lcase(title), ' !! ') as good_reads from books;

-- Other types of strings
SELECT INSERT('Hello Bobby', 6, 0, 'There');  
SELECT LEFT('omghahalol!', 3);
SELECT RIGHT('omghahalol!', 4);
SELECT TRIM('  pickle  ');

-- EXERCISES SOLUTION CODE
select reverse(ucase('Why does my cat look at me with such hatred?'))as reverse_ucase;
select replace(title,' ','->') as title from books;
select author_lname as forwards,reverse(author_lname) as backwards from books;
select ucase(concat(author_fname,' ',author_lname)) as full_name_in_caps from books;
select concat(title,' ',' was released in ',released_year) as blurb from books;
select title,char_length(title) as character_count from books;
SELECT 
    CONCAT(SUBSTR(title, 1, 10), ' ', '... ') AS short_title,
    CONCAT(author_lname, ',', author_fname) AS author,
    CONCAT(stock_quantity, ' in stock') AS quantity
FROM
    books;




