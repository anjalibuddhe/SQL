create table table1
(
id int,
name varchar(20),
city varchar(20)
)


insert into table1 values(1,'Sara','Pune')

create table table2
(
id_2 int,
name varchar(20),
L_name varchar(20)
)

insert into table2 values(1,'John','Nagpur')


INSERT INTO table1
SELECT * FROM  table2
WHERE name='John'


select * from table1