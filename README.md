
# School-Database
This project will used MySQL database and PHP to build a web database application. 

# Here is what is provided in the following files:
1. A cover page showing screen shots of the SQL queries being used to retrieve data from the database to be displayed on the web application.
2. An ER diagram for the database design.
3. The corresponding relational model with primary keys and foreign keys clearly specified.
4. The source code of the project, including the DDL that was used to create the tables
and the SQL that was used to implement the queries, as well as the PHP scripts that
was used to implement the user interface.
5. The screenshots of the interfaces you developed.
6. The screenshots of sample runs of the system, including inputs and outputs

# Database design for a university that satisfies the following requirements:
1. The database keeps information of each professor, including the social security number, name, address, telephone number, sex, title, salary, and college degrees. The address
includes street address, city, state, and zip code. The telephone number includes the
area code and 7 digit number.
2. Each department has a unique number, name, telephone, office location, and a chairperson who is a professor.
3. Each course has a unique number, title, textbook, units. Each course also has a set
of prerequisite courses. Each course is offered by a department.
4. Each course may have several sections. Each section has a section number that is
unique within the course, a classroom, a number of seats, meeting days, a beginning
time, an ending time. Each section is taught by a professor.
5. The database keeps student records, including the campus wide ID, name, address,
and telephone number. Each student majors in one department and may minor in several departments. The name includes first name and last name.
6. The database keeps enrollment records. Each record has a student, a course section,
and a grade.

Design your database and create at least the following numbers of records:

8 students, 2 departments, 3 professors     
4 courses, 6 sections, 20 enrollment records

You should provide interfaces for the following individuals:

For the professors:
a. Given the social security number of a professor, list the titles, classrooms, meeting
days and time of his/her classes.
b. Given a course number and a section number, count how many students get each
distinct grade, i.e. ‘A’, ‘A-’, ‘B+’, ‘B’, ‘B-’, etc.

For the students:
a. Given a course number list the sections of the course, including the classrooms, the
meeting days and time, and the number of students enrolled in each section.
b. Given the campus wide ID of a student, list all courses the student took and the
grades.
