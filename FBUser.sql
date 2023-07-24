create table FbUsers
(
userid int primary key,
username varchar(15) not null,
email varchar(15) not null,
phoneNo int not null,
totalPosts int not null
)
sp_help FbUsers


create table Post
(
postId  int primary key,
userid  int foreign key (userid) references FbUsers (userid),
postContent varchar(50) not null,
postImage varchar(30) not null,
PostVideo varchar(50) not null,
)
sp_help Post



--create table Friendship
--(
--statuscode int primary key,
--userid  int foreign key (userid) references FbUsers (userid),
--friendId int not null
--)
--sp_help Friendship
create table Friendship1
(
statuscode int primary key,
userid  int foreign key (userid) references FbUsers (userid),
friendId int not null
)
sp_help Friendship1

--Status code, Status
create table FriendShipSatus
(
statuscode int foreign key (statuscode) references Friendship1(statuscode),
Status varchar(10) not null
)

sp_help FriendShipSatus
