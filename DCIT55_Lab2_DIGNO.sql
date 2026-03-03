create database digno;
use digno;

create table dignolab (
	studentNumber int(11) auto_increment primary key,
	firstName varchar(100),
    lastName varchar(100) not null,
    middleName varchar(100),
    birthdate varchar(20),
    citizenship varchar(50) comment "Example: Filipino, Nigerian, Korean",
    gender varchar(100) comment "Male or Female"
);

show full columns from dignolab;

insert into dignolab values
	(202014912, "STEVEN", "ESPEDIDO", "ROSALDO", "2000-01-01", "FILIPINO", "MALE"),
	(202014165, "NINA KLARISSE", "ULANGKAYA", "AMBROSIO", "2000-01-02", "FILIPINO", "FEMALE"),
    (202011535, 'ADRIAN', 'CARRANZA', 'RUBIA', '2000-01-03', 'FILIPINO', 'MALE'),
    (202011818, 'JEAN', 'DACLES', 'RICO', '2000-01-04', 'FILIPINO', 'FEMALE'),
    (202012336, 'GILLIAN KYLE', 'CATAHAN', 'DIMAALA', '2000-01-05', 'FILIPINO', 'MALE');
    
alter table dignolab change gender sex varchar(6);
alter table dignolab change birthdate birthdate date;
alter table dignolab change citizenship citizenship varchar(20);

alter table dignolab add age int(3) after birthdate;

alter table dignolab rename studentinfo;

select upper(firstName) as "First Name", upper(lastName) as "Last Name", upper(middleName) as "Middle Name"
from studentinfo;

select studentNumber, firstName, lastName, middleName, birthdate, age, 
replace(citizenship, 'FILIPINO', 'Pinoy') as citizenship, sex
from studentinfo;

select studentNumber, concat_ws(' ', firstName, middleName, lastName) as "FULL NAME"
from studentinfo;
	
select repeat(lastName, 5) as "Repeated Last Name" 
from studentinfo;

update studentinfo 
set age = date_format(curdate(), '%Y') - date_format(birthdate, '%Y');

select avg(age) as AverageAge 
from studentinfo;

select studentNumber, firstName, lastName, middleName, date_format(birthdate, '%M %d, %Y') as FormattedBirthdate, age, citizenship, sex
from studentinfo;

select sex, count(sex) as TotalStudents 
from studentinfo 
group by sex;

select * from studentinfo 
order by lastName asc;

DROP database digno;

