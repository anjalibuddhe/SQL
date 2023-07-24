
create table Course(
cid int primary key,
cname varchar(20) not null,
subject varchar(25) not null,
fee int not null,
duration int not null
)
exec sp_help Course

create table Student
(
sid int primary key,
sname varchar(20) not null,
cid int,
constraint fk_stud_course foreign key (cid) references Course(cid)

)
sp_help Student
