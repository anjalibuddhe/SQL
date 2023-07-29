CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(255) NOT NULL,
    ph_no VARCHAR(20),
    email VARCHAR(255),
    address VARCHAR(255),
    city VARCHAR(100)
)

INSERT INTO Authors values(101, 'Gita Mehta', '784-556-8890', 'Gita@mail.com', '1 Pune', 'India'),
(102,'H.S. Vatsyayan','123-654-987','H@mail.com','2 Mumabi','India')
INSERT INTO Authors Values(103,'Bimal Jalal','432-456-789','Bimal@mail.com','3 Norway','Franc'),
(104,'Smriti Irani','098-345-761','Smitri@gmail.com',' 4 Kabul','Afghanistan'),
(105,'Prem Rawat','465-098-765','Prem@gmail.com','5 Algiers','Algeria'),
(106,'Rajesh Talwar','345-987-765','Rajesh@mail.com','6 Vella','Andorra	')

select * from Authors
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    book_name VARCHAR(255) NOT NULL,
    author_id INT,
    price DECIMAL(10, 2),
    published_date VARCHAR(20),
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
)


alter table Book add published_date varchar(20)


insert into Books values (1, 'A River Sutra ', 101, 200.99, '2020-01-29'),(2,'A Sense of Time',102,300.00,'9091-02-30')
insert into Books values (3,'The India Story',103,399.00,'9090-08-09'),(4,'Queen of Fire',104,459.99,'2023-04-08'),
(5,'Lal Salam',105,678.00,'2022-03-23'),(6,'Hear Yourself',106,349.99,'2018-05-09')

CREATE TABLE AwardsMaster (
    award_type_id INT PRIMARY KEY,
    award_name VARCHAR(255) NOT NULL,
    award_price DECIMAL(10, 2)
)


 insert into AwardsMaster values(201, 'Bellwether Prize', 1000.00)
 insert into AwardsMaster values(202, 'National Book Awards', 29999.00)
 insert into AwardsMaster values(203, 'Costa Book Awards', 19999.00)
 insert into AwardsMaster values(204, 'Women Prize for Fiction', 25999.00)
 insert into AwardsMaster values(205, 'Best Fiction Award', 39999.00)
 insert into AwardsMaster values(206, 'BookBrowse Awards', 45999.00)


CREATE TABLE Awards (
    award_id INT PRIMARY KEY,
    award_type_id INT,
    author_id INT,
    book_id INT,
    year INT,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
	FOREIGN KEY (award_type_id) REFERENCES AwardsMaster(award_type_id)
)
sp_help Awards

insert into Awards values (1, 201, 101, 1, 2023)
insert into Awards values (2, 202, 102, 2, 1990)
insert into Awards values (3, 203, 103, 3, 2020)
insert into Awards values (4, 204, 104, 4, 2019)
insert into Awards values (5, 205, 105, 5, 2016)
insert into Awards values (6, 206, 106, 6, 2010)
select * from Awards




 
--Write a query to show book name , author name and award name for all books which has received any award. 

SELECT b.book_name, a.author_name,am.award_name
FROM Books b
JOIN Authors a ON b.author_id = a.author_id
JOIN Awards aw ON b.book_id = aw.book_id
JOIN AwardsMaster am ON aw.award_type_id = am.award_type_id;


 
--Write a query to update author name of authors whose book price is > 399.00. Prefix author name with ‘Gita’ .

update Authors
set author_name = concat('Gita ', author_name)
where author_id IN (
    select author_id
    from Books
    where price > 399.00
)




--Write a query to display authors and number of books written by that author. Show author who has written maximum books at the top.

select  a.author_name,count(b.book_id) as 'Book_count'
from Authors a
inner join Books b on  a.author_id=b.author_id
group by a.author_name
order by count(b.book_id) desc



--Write a query to select book name with 5 th highest price.

select * from Books order  by price desc offset 4 rows fetch next 1 rows only





--Select list of books which have same price as book ‘Diary of Ann Frank’.


select book_id, book_name, author_id, price, published_date
from Books
where price = (
    select price
    from Books
    where book_name = 'The India Story'
)



--Increase price of all books written by Mr. Chetan Bhagat by 5

select author_name from Authors where author_name='Gita Mehta'

UPDATE Books set price = price * 0.05 where author_id = 101



--Show award names and number of books which got these awards. 


select am.award_name, count(a.book_id) AS num_books 
from AwardsMaster am
left join Awards a on am.award_type_id = a.award_type_id
group by am.award_name



--Delete all books written by ‘Chetan Bhagat’ 
select author_id
from Authors
where author_name = 'Prem Rawat'

delete Books
where author_id = 105



--Create view to show name of book and year when it has received award. 

create view AwardReceived 
as
select b.book_name  ,a.
Books b
inner join Awards a



--Create trigger to ensure min price of any book must be Rs. 100. 



--Increase price of book by 10% if that book has received any award.





--Show names of author and number of books written by that Author.
select au.author_name, count(b.book_id) as num_books_written
from Authors au
left join Books b on au.author_id = b.author_id
group by au.author_id, au.author_name



--Show names of authors whose books are published before year 2020.

select distinct au.author_name
from Authors au
join Books b on au.author_id = b.author_id
where b.published_date < '2020-01-01'


--Show name of books which has published within 1 year after 15 August 2020.

select book_name
from Books
where published_date between '2020-08-16' and '2021-08-15';

--where published_date between '2018-05-09' and '2023-04-08'


--Delete all authors whose no book is published in year 2020.

delete from Authors
where author_id NOT IN (
    select distinct author_id
    from Books
    where published_date LIKE '%2020%'
)






 select  * from Books 
 select  * from Authors 
 select  * from Awards
 select  * from AwardsMaster