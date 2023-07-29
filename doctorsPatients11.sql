create table Provience_Names(
Provience_Id int primary key,
Provience_Name varchar(30)
)

insert into Provience_Names values(1,'Madras')
insert into Provience_Names values(2,'Bombay')
insert into Provience_Names values(3,'Madras')
insert into Provience_Names values(4,'Kolkatta')
insert into Provience_Names values(5,'Madras')

create table doctors(
docid int primary key,
f_name varchar(10),
l_name varchar(10),
speciality varchar(25)
)



insert into doctors values(11,'Siddhart',' Mukherjee','Biologist')
insert into doctors values(12,'Devi','Shetty','Cardiologist')
insert into doctors values(13,'Surabi','Anand','Dermatologist')
insert into doctors values(14,'Aditya','Gupta','gynecologist')
insert into doctors values(15,'Mohamed','Rela','Neurologist')

create table patients(
patient_id int primary key,
First_Name  varchar(20),
Last_Name varchar(20),
Gender varchar(10),
BirthDate varchar(20),
City varchar(25),
Provience_Id int foreign key(Provience_Id) references Provience_Names(Provience_Id),
docid int foreign key(docid) references doctors(docid),
Allergies varchar(30),
Height decimal(3,0),
Weights Decimal(4,0)
)


insert into patients values(101,'Vidyashree','Hipparagi','F','01/01/2000','Sangli',2,11,'Hay Fever',5.6,55)
insert into patients values(102,'Akshata','Sabne','F','13/07/1999','Latur',1,12,'Pet Allergy',5.4,45)
insert into patients values(103,'Sagar','Kawade','M','01/12/2000','Solapur',3,13,'Dust Allergy',5.7,57)
insert into patients values(104,'Anjali','Buddhe','F','12/04/1997','Beed',4,14,'Food Allergy',5.5,50)
insert into patients values(105,'Pankaj','Daundakar','M','02/11/1991','Pune',1,15,'Pollean Allergy',6,65)




create table admissions(
 patient_id int constraint pid_fk foreign key(patient_id) references patients(patient_id),
 ad_date varchar(20),
 dis_date varchar(20),
 diagnosis varchar(50),
 attending_doc_id int
 )


 
 insert into admissions values(101,'01/06/2022','06/06/2022','Fever',11)
 insert into admissions values(102,'11/06/2022','16/06/2022','Cough',12)
 insert into admissions values(103,'21/11/2021','26/11/2021','Pain',15)
 insert into admissions values(104,'12/08/2022','18/08/2022','CBC',14)
 insert into admissions values(105,'05/07/2023','15/07/2023','Hiboglobin',13)



 --	Show the first name, last name and gender of patients who’s gender is ‘M’

select First_Name,Last_Name,Gender from patients where Gender='M'



--	Show the first name & last name of patients who does not have any allergies

select First_Name,Last_Name from patients where Allergies is null

--	Show the patients details that start with letter ‘C’


select * from patients where  First_Name like '%c'

--	Show the patients details that height range 100 to 200

select * from patients where Height between 4 and 6


--	Update the patient table for the allergies column. Replace ‘NKA’ where allergies is null

update patients set Allergies='NKA' where Allergies is null


--	Show how many patients have birth year is 2020

select * from  patients where  BirthDate='2020'


--	Show the patients details who have greatest height

--select top 1 * from patients order by Height desc

select * from patients where Height=(select max(Height) from patients)

--	Show the total amount of male patients and the total amount of female patients in the patients table.

select Gender, COUNT(*) as TotalPatients
from patients
group by Gender


--	Show first and last name, allergies from patients which have allergies to either 'Penicillin' or 'Morphine'. Show results ordered ascending by allergies then by first_name then by last_name.

select first_name, last_name, Allergies
from patients
where Allergies IN ('Penicillin', 'Morphine')
order by Allergies asc, first_name asc, last_name asc



--	Show first_name, last_name, and the total number of admissions attended for each doctor.


SELECT d.f_name, d.l_name, COUNT(a.patient_id) AS total_admissions_attended
FROM doctors d
LEFT JOIN patients a ON d.docid = a.docid
GROUP BY d.f_name, d.l_name



--Every admission has been attended by a doctor.





--For every admission, display the patient's full name, their admission diagnosis, and their doctor's full name who diagnosed their problem.

select p.First_Name  as 'Patientname' ,a.diagnosis,d.f_name as 'Doctorname'
   from patients p 
   inner join admissions a on p.patient_id=a.patient_id
   inner join doctors d on  d.docid=a.docid
   where diagnosis is not null