create table Breakfast
(
Bname varchar(30)
)

insert into Breakfast values('Poha')
insert into Breakfast values('Dosa')
insert into Breakfast values('Upama')
insert into Breakfast values('Idli')
insert into Breakfast values('Vada Sambhar')

create table Drinks
(
Dname varchar(30)
)

insert into Drinks values('Tea')
insert into Drinks values('Coffee')
insert into Drinks values('Milk')
insert into Drinks values('Green Tea')
insert into Drinks values('Juice')

select * from Breakfast
select * from Drinks

select * from Breakfast cross join Drinks