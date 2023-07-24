create table BookT
(
bookId int primary key,
bookname varchar(20) not null,
authorId int not null,
price int not null
)

exec sp_help BookT



create table Author
(
	authorid int primary key,
	authorname varchar(15) not null,
	phnNo int not null,
	email varchar(15) not null,
	address varchar(20) not null,
	city varchar(10),
)
exec sp_help Author

create  table Awardmaster
(
awardtypeid int primary key,
awardname varchar(20) not null,
awardprice int not null
)

create table AwardTable

(
awardid int primary key,
awardtypeid int foreign key (awardtypeid) references Awardmaster(awardtypeid),
authorid int foreign key (authorid) references Author (authorid),
bookId int foreign key (bookId) references BookT (bookId),
year int not null
)

exec sp_help AwardTable