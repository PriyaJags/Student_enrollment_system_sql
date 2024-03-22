# Student_enrollment_system_sql
This is a student enrollment system , using Mysql 
This repository contains SQL scripts to create tables for a student enrollment system. The system consists of the following tables:

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

