# Project 1 - Student enrollment system using Mysql
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

# Project 2 - Given stored data link

queries need to be performed for STORE DATA:

STORE DATA needs to be imported ffrom this EXCEL:

1. select the data who is making profit
2. select the data who is making profit with discount >= 0.5
3. select unique customerID
4. Take the categories & subcategories in where this unique customerID present
5. select most profit making city
6. create a newtable duplicate TABLE
7. In new table delete the rows whos discount is < 0.3
8. find what category is saled most
9. find which shipmode made most profit  
10. GET which subcategories quantity is high
11. select the rank of 21-31 most sales record
12. create a new column combining category & subcategories ex category = 'Office Supplies' subcategories = 'Binders' newColumn = 'Office Supplies-Binders'
13. select the data shipped after 8/3/2015 and befor 1/10/2017
14. find the most used customerID
15. create a new column having customer_name_lenght
16. how many unique orders created
17. what orderID has the most saled
18. randk the ordID based on the sales, grouped on city
19.  find the windowfunction-sum basedon partion by date
20. productID sales
