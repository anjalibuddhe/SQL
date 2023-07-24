
create table Author
(
authorid int primary key,
name varchar(20) not null,
city varchar(20) not null,
country varchar(20) not null
)
sp_help Author
create table Category
(
catId int primary key,
descrption varchar(20)

)

sp_help Category

create table Book
(
bookid int primary key,
title varchar(15) not null,
authorid int foreign key (authorid) references Author (authorid),
catId  int foreign key (catId) references Category(catId),
year int not null,
price float not null,
publisher varchar(20) not null,
rating int not null

)

sp_help Book

create table OrderDetails
(
orederno int,
bookid int foreign key (bookid) references Book(bookid),
qty int not null,
)

sp_help OrderDetails