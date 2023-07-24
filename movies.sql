
create table Movies
(
moviesId int primary key,
moviename varchar(20) not null,
releaseYear int not null,
collection int not null
)
sp_help Movies

create table Roles
(
rollId int primary key,
rollname varchar(20) not null,

)

sp_help Roles

create table Celebrity
(
celebrityid int primary key,
celebrityname varchar(20) not null,
birthday int not null,
phnNo int not null,
email varchar(15) not null
)
sp_help Celebrity

create table BollywoodData
(
dataId int,
celebrityid int foreign key(celebrityid) references Celebrity(celebrityid),

moviesId int foreign key (moviesId) references Movies(moviesId),
rollId int foreign key (rollId) references Roles (rollId),
awardprice int not null
)
sp_help Celebrity