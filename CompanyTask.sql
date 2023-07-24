create table Student

(
Sid int primary key,
Name varchar(20),
City varchar(20)
)

insert into Student values(1,'Ram','Pune')
insert into Student values(2,'Sham','Mumbai')
insert into Student values(3,'Sita','Pune')
insert into Student values(4,'Gita','Nashik')

select * from Student

create table Subjects(
Subid int primary key,
SubName varchar(20),
MaxMarks int,
Passing int
)

insert into Subjects values(1,'Maths',100,40)
insert into Subjects values(2,'English',100,40)
insert into Subjects values(3,'Marathi',50,15)
insert into Subjects values(4,'Hindi',50,15)


create table Exam
(

Sid int foreign key (Sid) references Student(Sid),
Subid int foreign key (Subid) references Subjects(Subid),
Marks int
)

insert into Exam values(1,1,100)
insert into Exam values(1,2,85)
insert into Exam values(1,3,40)
insert into Exam values(1,4,45)
insert into Exam values(2,1,35)
insert into Exam values(2,2,55)
insert into Exam values(2,3,25)
insert into Exam values(3,1,95)
insert into Exam values(3,2,87)
insert into Exam values(3,3,45)
insert into Exam values(3,4,42)

insert into Student values(5,'Ramesh','Hyderabad')

update Student set City='sangli' where Sid=4

select Sid,Name, City from Student

--Return list containing columns SID, Name, SubName, Marks, MaxMarks, Percentage

select s.Sid, s.Name, su.SubName, es.Marks, su.MaxMarks ,(es.Marks/su.MaxMarks)*100  AS Percentage
from Student s 
join Exam es on s.Sid=es.Sid
join Subjects su on es.Subid =su.Subid












