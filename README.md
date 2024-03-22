# Student enrollment system using Mysql
This is a student enrollment system , using Mysql 

This repository contains SQL scripts to create tables for a student enrollment system. 

The system consists of the following tables:

STUDENT TABLE:
studentId,
first name,
last name,
email,
yoj

COURSE TABLE:
courseId,
courseName,
branch,
couse fees

INSTRUCTOR table:
instructorId,
first name,
last name
email

ENROLLMENT table:
enrollmentId,
studentId - from student table,
courseId - from COURSE table

INSTRUCTOR_COURSE_ID:
instructor_course_id,
instructorid,
courseid

INSERT VALUES INTO ALL THE TABLES

PERFORM THESE QUERIES

1. unique enrollment count i.e how many users purchased my course 
2. retrive the course name not entrolled by student
3. courseId,course_name,course_branch,instructorId,first name
4. student_details with courseId
5. display the student based on no max course they purchased
6. rank for that student based on course fees

