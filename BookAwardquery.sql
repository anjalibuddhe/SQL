--create table BookT
--(
--bookId int primary key,
--bookname varchar(20) not null,
--authorId int not null,
--price int not null
--)

--drop  table BookT
--exec sp_help BookT

--insert into BookT values(101,'Diary of Ann Frank', 1, 300),(102,'One Indian Girl',2,400)
--insert into BookT values(103,'Naked Triangle', 4, 300)
--insert into BookT values(105,'A Brush with Life ', 5, 399)
--insert into BookT values(106,'A Village by the Sea ',6,599)
--insert into BookT values(104,'Agnibeena',4,599)



--select * from BookT

--create table Author
--(
--	authorid int primary key,
--	authorname varchar(15) not null,
--	phnNo int not null,
--	email varchar(15) not null,
--	address varchar(20) not null,
--	city varchar(10),
--)
--exec sp_help Author

--drop table Author

--insert into  Author values(1,'	L.K. Advani',234-5678,'	Adv@mail.com','India','Pune')

--create  table Awardmaster
--(
--awardtypeid int primary key,
--awardname varchar(20) not null,
--awardprice int not null
--)

--insert into Awardmaster values (12, 'National Book Awards',100000),(13,'Edgar Award',200000),(14,'Hugo Award',250000)
--insert into Awardmaster values (15, 'Printz Award',199999),(16,'John Newbery Medal',500000),(17,'The Forward Prizes',550000)

--select * from Awardmaster

--drop table Awardmaster

--create table AwardTable

--(
--awardid int primary key,
--awardtypeid int foreign key (awardtypeid) references Awardmaster(awardtypeid),
--authorid int foreign key (authorid) references Author (authorid),
--bookId int foreign key (bookId) references BookT (bookId),
--year int not null
--)
--drop table AwardTable
--insert into AwardTable values(11,12,1,101,20000)
--exec sp_help AwardTable



--Write a query to show book name , author name and award name for all books which has received any award. 

--select B.bookname,Au.authorname,Am. from BookT B inner join Author Au on B.bookId=Au.authorid 
--join AwardTable Am on B.bookId=Am.
 
--Write a query to update author name of authors whose book price is > 100. Prefix author name with ‘Honourable’ .

--Write a query to display authors and number of books written by that author. Show author who has written maximum books at the top.

--Write a query to select book name with 5 th highest price.

--Select list of books which have same price as book ‘Diary of Ann Frank’.

--Increase price of all books written by Mr. Chetan Bhagat by 5%.

--Show award names and number of books which got these awards. 

--Delete all books written by ‘Chetan Bhagat’ 

--Create view to show name of book and year when it has received award. 

--Create trigger to ensure min price of any book must be Rs. 100. 

--Increase price of book by 10% if that book has received any award.

--Show names of author and number of books written by that Author.

--Show names of authors whose books are published before year 2020.

--Show name of books which has published within 1 year after 15 August 2020.

--Delete all authors whose no book is published in year 2020.




