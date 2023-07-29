create table Trainer (
    trainer_id int primary key,
    trainer_name varchar(20) NOT NULL,
    join_date varchar(20),
    email varchar(30),
    experience_in_years int
)

insert into Trainer 
values(201, 'B. R. Ambedkar', '2022-09-08', 'Ameedkar@mail.com', 3),
    (202, 'Abdul Kalam', '2020-03-1', 'abdul@mail.com', 5),
    (203, 'Mother Teresa', '2023-06-08', 'Mother@mail.com', 8),
    (204, 'Mother Teresa', '2013-05-08', 'Mother@mail.com', 5),
    (205, 'Indira Gandhi', '2023-06-08', 'Indira@mail.com', 8)




create table Courses (
    course_id int primary key,
    course_name varchar(20),
    duration_months int,
    trainer_id int,
    total_fees decimal(10, 2),
    foreign key (trainer_id) references Trainer(trainer_id)
)

insert into Courses 
values(101, 'Computer', 8, 201, 6000.00),
    (102, 'Electronics', 4, 202, 4000.00),
    (103, 'English', 5, 203, 5000.00),
	(104, 'Sciences', 6, 204, 6000.00),	
	(105, 'Maths', 3, 205, 6000.00)





create table Students (
    rollno int primary key,
    sname varchar(20),
    degree varchar(20),
    birthdate varchar(15),
    course_id int,
    batch_id int,
    fees_paid numeric(10, 2),
    Remark varchar(20),
    is_placed varchar(10),
    foreign key (course_id) references Courses(course_id)
)

insert into Students 
  values  (1, 'Hari', 'Computer Engineering', '1999-05-15', 101, 2023, 5000.00, 'Good', 'Yes'),
    (2, 'John', 'ElectronicsEngineer', '2000-02-28', 102, 2022, 4500.00, 'Hardworking', 'No'),
    (3, 'Sara', 'Mechanical Engineer', '1998-11-10', 103, 2021, 5500.00, 'Good', 'Yes'),
    (4, 'Atul', 'Mechanical Engineer', '1998-11-10', 103, 2021, 5500.00, 'Hardworking', 'No')



--1. Show list of students. List contains roll no , student name , course name , trainer name in 
--order of course name and student name.
select s.rollno, s.sname as student_name, c.course_name, t.trainer_name
from Students s
JOIN Courses c on s.course_id = c.course_id
JOIN Trainer t on c.trainer_id = t.trainer_id
order by c.course_name, s.sname


--2. Show list of students who have pending fees more than 1000rs . List should have student 
--name , course name , balance fees . Show this list in descending order of balance fees.

select s.sname,c.course_name,(c.total_fees-s.fees_Paid) as Balance
from Students s
join Courses c on c.course_id=s.course_id
join Trainer t on t.trainer_id=c.trainer_id
where (c.total_fees-s.fees_paid)>1000
order by Balance desc


--3. Append letter ‘_spl’ to all batch ids of trainer ‘Deepa’.

update Students
set batch_id = CONCAT(batch_id, '_spl')
where trainer_id = (
    SELECT trainer_id
    FROM Trainer
    WHERE trainer_name = 'Mother Teresa'
)






--4. Update table student. Update ‘remark’ field. Remark should be ‘Eligible for exam’ if fees paid 
--by student is more than 60%.



select s.Remark 
from Students s
inner join Courses c on c.course_id=s.course_id
UPDATE Students 
SET Remark = 'Eligible for exam'
WHERE fees_paid=(select total_fees from Courses

where fees_paid > (total_fees * 0.6))



--5. Create a index to make retrieval faster based on course name
;

create index index_coures on  Courses(course_name)



--6. List name of course for which more than 20 students are enrolled.


select * from Courses where course_id in(select course_id from Students group by course_id having count(*)>1) 
select s.sname,c.course_id,c.course_name
from Students s
inner join Courses c on c.course_id=s.course_id
group by c.course_name
having count(c.course_id)>2






--7. List name of course for which maximum revenue was generated. ( max fee collection)


select course_name from Courses where course_id in(select top(1) course_id,
count(*) from Students Group by course_id Order by sum(fees_paid)desc)


--8. Select name of student who are in same batch as ‘Atul’.

select sname  from Students where batch_id in(select batch_id from Students where sname='Atul')




--9. Delete all students who are in course which is less than 2 months duration.

delete from Students where course_id in (select course_id from Courses where duration_months <2)




--10. Delete all students for whom is placed is ‘yes’ and who have paid all the fees of their course.


delete from Students s
join Courses c on c.course_id=s.course_id

where (c.total_fees-s.fees_paid)=0




--11. Create a trigger to add student data in ex-student table if student is deleted from student 
--table.


--12. Create a view which shows name of trainer and number of students he is training.


--13. Show names of students who are more than 20 years old.


--14. Show names of students who have paid all the fees. 

select
    Students.sname
from Students join
    Courses on Students.course_id = Courses.course_id
group by
    Students.sname
having
    sum(Students.fees_paid) >= Courses.total_fees



--15. Write a procedure which accepts student id and returns his balance fees. 