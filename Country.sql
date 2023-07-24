create table Countries
(
countryid int primary key ,
countryname varchar(15) not null
)

sp_help Countries

create table Format
(
formatid int primary key , 
formatname varchar(15) not null,
)

sp_help Format

create table Batsman 
(
playerid int primary key,
playername varchar(15) not null,
age int not null,
countryid int foreign key (countryid) references Countries(countryid),
totalruns int not null,
total50s int not null,
total100s int not null,
playergrade varchar(10) not null
)
sp_help Batsman

create table Mapping
(
id int primary key,
playerid int foreign key (playerid) references Batsman (playerid), 
formatid int foreign key (formatid) references Format(formatid)
)

sp_help Mapping