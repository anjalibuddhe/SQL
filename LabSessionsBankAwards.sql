CREATE TABLE Book (
    book_id INT PRIMARY KEY,
    book_name VARCHAR(100) NOT NULL,
    author_id INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (author_id) REFERENCES Author(author_id)
)

INSERT INTO Book (book_id, book_name, author_id, price)
VALUES
    (101, 'Harry Potter and the Philosopher''s Stone', 1, 25.99),
    (102, 'The Shining', 2, 18.99),
    (103, 'Sense and Sensibility', 3, 12.50),
    (104, '1984', 4, 14.75),
    (105, 'Murder on the Orient Express', 5, 9.99)

CREATE TABLE Author (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(100) NOT NULL,
    ph_no VARCHAR(20),
    email VARCHAR(100),
    address VARCHAR(200),
    city VARCHAR(100)
)


INSERT INTO Author 
VALUES
    (1, 'J.K. Rowling', '123-456-7890', 'jkrowling@example.com', '123 Main St', 'London'),
    (2, 'Stephen King', '987-654-3210', 'stephenking@example.com', '456 Elm St', 'New York'),
    (3, 'Jane Austen', '555-123-4567', 'janeausten@example.com', '789 Oak St', 'Bath'),
    (4, 'George Orwell', '111-222-3333', 'georgeorwell@example.com', '555 Pine St', 'London'),
    (5, 'Agatha Christie', '444-555-6666', 'agathachristie@example.com', '777 Maple St', 'Devon')


CREATE TABLE AwardMaster (
    award_id INT PRIMARY KEY,
    award_type_id INT,
    author_id INT,
    book_id INT,
    year INT,
    FOREIGN KEY (award_type_id) REFERENCES Awards(award_type_id),
    FOREIGN KEY (author_id) REFERENCES Author(author_id),
    FOREIGN KEY (book_id) REFERENCES Book(book_id)
)

INSERT INTO AwardMaster
VALUES
    (201, 2, 1, 101, 2001),
    (202, 1, 2, 102, 1990),
    (203, 3, 3, 103, 1811),
    (204, 4, 4, 104, 1949),
    (205, 5, 5, 105, 1934)

CREATE TABLE Awards (
    award_type_id INT PRIMARY KEY,
    award_name VARCHAR(100),
    award_price DECIMAL(10, 2)
)


INSERT INTO Awards (award_type_id, award_name, award_price)
VALUES
    (1, 'Pulitzer Prize', 10000),
    (2, 'Nobel Prize', 20000),
    (3, 'Booker Prize', 15000),
    (4, 'Hugo Award', 8000),
    (5, 'National Book Award', 12000)
INSERT INTO Awards values    (106, 'National Book Award', 12000)






--1. find book name written by xyz
select book_name from Book where author_id= 

(
select author_id from Author where author_name='Stephen King'
)

----------------------------------
select b.book_name from Book b ,Author a
where a.author_id=b.author_id and
a.author_name='Stephen King'



--2.find a no. of awards for each author
select
    Author.author_id,
    Author.author_name,
    COUNT(Awards.award_type_id) as num_of_awards
from Author left join
    Awards on Author.author_id = Awards.award_type_id
group by
    Author.author_id, Author.author_name





--3.find a  award name for the book xyz


select award_name from Awards where award_type_id in 

(select award_type_id from AwardMaster where book_id )=


(select book_id from Book where book_name='1984')


--4.  find all the author name who got an award

select
    Author.author_id,
	Author.author_name
	from Author Left join
	   Awards on Author.author_id = Awards.award_type_id
	group by
    Author.author_id, Author.author_name

	-------------------------------------------------------

select a.author_name  from Author a join AwardMaster b on a.author_id=b.author_id
select author_id from Author where author_id in(select author_id from AwardMaster)

--5 find year wise author count

select
    year,
    COUNT(DISTINCT author_id) AS author_count
FROM
    AwardMaster group by year order by year





--6. find a author name who wrote only one book

select a.author_name,count(*) as 'One_Book' from Book b
join Author a on a.author_id=b.author_id group by 
a.author_name having COUNT(*)=1


--7 find a book name which has max price


select
    Book.book_name
FROM
    Book
JOIN
    (SELECT MAX(price) AS max_price FROM Book) AS MaxPriceTable
ON
    Book.price = MaxPriceTable.max_price;





