use guvi_q4_project;
show tables;

-- student table
create table student(
student_id int primary key auto_increment,
firstname varchar(255),
lastname varchar (255),
email varchar(25),
yr_of_joining date);
 
-- course table
create table course(
course_id varchar(20) primary key,
coursename varchar(255),
branch varchar (255),
coursefees int);

-- instructor table 
create table instructor(
instructor_id varchar(20) primary key,
firstname varchar(255),
lastname varchar (255),
email varchar(25));

-- enrollment table -- junction table
create table enrollment(
enrollment_id varchar(20) primary key,
student_id int not null, foreign key(student_id) references student(student_id),
course_id varchar(20) not null, foreign key(course_id) references course(course_id),
UNIQUE (student_id, course_id),
enrollmentdate date);

-- Instructor_Course table -- juncton table
create table Instructor_Course (
	Instructor_Course_id varchar(20) PRIMARY KEY,
    instructor_id varchar(20),
    foreign key (instructor_id) references Instructor(instructor_id),
    course_id  varchar(20),
	foreign key (course_id) references Course(course_id),
    UNIQUE (instructor_id, course_id)
);

-- insert into student table
insert into student(firstname,lastname,email,yr_of_joining )
values('Anitha','vashisht','anivas@gmail.com','2022-09-05');
insert into student(firstname,lastname,email,yr_of_joining )
values('zara','john','zaj@dfg.com','2021-01-04');
insert into student(firstname,lastname,email,yr_of_joining )
values('veena','madhav','veen@gmail.com','2023-02-04');
insert into student(firstname,lastname,email,yr_of_joining )
values('kushi','G','kush@dfg.com','2020-09-09');
insert into student(firstname,lastname,email,yr_of_joining )
values('Shreya','harsh','shreha@gmail.com','2023-04-04');
insert into student(firstname,lastname,email,yr_of_joining )
values('Bindu','K','Bink@dfg.com','2020-04-04');
insert into student(firstname,lastname,email,yr_of_joining )
values('Yamini','V','yaav@ail.com','2022-06-04');
insert into student(firstname,lastname,email,yr_of_joining )
values('Celina','Jat','Cel@gmail.com','2021-04-09');
insert into student(firstname,lastname,email,yr_of_joining )
values('Rohan','V','rova@gmail.com','2023-04-12');
insert into student(firstname,lastname,email,yr_of_joining )
values('Dinesh','S','diha@gmail.com','2023-04-04');
insert into student(firstname,lastname,email,yr_of_joining )
values('Aman','hari','haam@gmail.com','2020-07-04');
insert into student(firstname,lastname,email,yr_of_joining )
values('Siddharth','L','sida@gmail.com','2023-09-04');

-- insert into course table;
insert into course values('C1','Python','DataScience',3500);
insert into course values('C2','React','FullStack',2000);
insert into course values('C3','C++','FullStack',3000);
insert into course values('C4','Java','FullStack',3500);
insert into course values('C5','sql','DataScience',2000);
insert into course values('C6','R','DataScience',2000);
insert into course values('C7','PowerBI','DataScience',2500);
insert into course values('C8','selenium','Testing',2500);
insert into course values('C9','html','FullStack',2000);
insert into course values('C10','css','DataScience',2000);

-- insert into instructor table;
insert into instructor values('I1','Beena','agarwal','ben@xyzmail.com');
insert into instructor values('I2','Tulasi','arul','tula@abcmail.com');
insert into instructor values('I3','Eeshwar','G','eegn@xyzmail.com');
insert into instructor values('I4','Fathima','B','fab@abcmail.com');
insert into instructor values('I5','Naresh','V','nar@xyzmail.com');
insert into instructor values('I6','Om','Prakash','omp@abcmail.com');

-- insert into enrollment table;
insert into enrollment values('E1',1,'C1','2022-04-06');
insert into enrollment values('E2',4,'C2','2022-03-29');
insert into enrollment values('E3',5,'C5','2023-12-12');
insert into enrollment values('E4',4,'C1','2022-12-06');
insert into enrollment values('E5',5,'C4','2024-01-06');
insert into enrollment values('E6',12,'C2','2023-04-06');
insert into enrollment values('E7',11,'C1','2022-08-29');
insert into enrollment values('E8',10,'C10','2023-12-12');
insert into enrollment values('E9',8,'C7','2022-12-06');
insert into enrollment values('E10',9,'C6','2024-01-06');

-- insert into instructor_course table
insert into instructor_course values('IC1','I1','C4');
insert into instructor_course values('IC2','I2','C5');
insert into instructor_course values('IC3','I3','C8');
insert into instructor_course values('IC4','I4','C4');
insert into instructor_course values('IC5','I5','C7');
insert into instructor_course  values('IC6','I6','C10');
insert into instructor_course values('IC7','I5','C6');
insert into instructor_course  values('IC8','I6','C1');

select * from student;
select * from course;
select * from instructor;
select * from enrollment;
select * from instructor_course;

-- 1. unique enrollment count - how many number of students enrolled in particular courses
select enrollment.course_id,course.coursename,course.branch,
count(enrollment.student_id) as num_of_students_enrolled
from enrollment inner join course on enrollment.course_id=course.course_id group by enrollment.course_id
 order by num_of_students_enrolled desc;
 
 -- 2. retrieval of courses not enrolled by any students
select course.course_id,course.coursename as course_not_enrolled_by_any_students from course 
left join enrollment on  course.course_id= enrollment.course_id 
where enrollment.course_id is null ;

-- 3. retrieval of course details and correspoding instructor details;
select course.course_id, course.coursename,course.branch,
instructor.firstname as instructor_firstname,instructor.lastname from instructor_course
inner join course on instructor_course.course_id=course.course_id
inner join instructor on instructor.instructor_id=instructor_course.instructor_id
order by course_id;

-- 4. retrieval of student details with courseid
select student.student_id,student.firstname,student.lastname,
enrollment.course_id,course.coursename
from enrollment 
inner join student on enrollment.student_id=student.student_id 
inner join course on enrollment.course_id=course.course_id 
order by enrollment.student_id;

-- 5. display student details based on number of courses purchased
select enrollment.student_id,student.firstname,student.lastname,count(course_id) as number_of_courses_enrolled 
from enrollment 
inner join student on student.student_id=enrollment.student_id 
group by student_id
order by number_of_courses_enrolled desc;

-- 6. rank for that student based on course fees
create table total_fees as 
select student.student_id,student.firstname,
sum(course.coursefees) as total_fees from course 
inner join enrollment on
enrollment.course_id=course.course_id
inner join student on
enrollment.student_id=student.student_id
group by
student.student_id;

select *,rank() 
over (order by total_fees desc) as studentrank_based_on_fees
from total_fees;