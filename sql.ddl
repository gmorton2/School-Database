#=================================================================================================================Professor Table
CREATE TABLE Professor(
ssn_number VARCHAR(30) NOT NULL PRIMARY KEY, 
firstname VARCHAR(30) NOT NULL, 
lastname VARCHAR(30) NOT NULL, 
street_address VARCHAR(30) NOT NULL, 
city VARCHAR(30) NOT NULL, 
state VARCHAR(30) NOT NULL, 
zip_code VARCHAR(10) NOT NULL,
area_code VARCHAR(4) NOT NULL,
telephone_number VARCHAR(15) NOT NULL, 
sex VARCHAR(6), 
title VARCHAR(40), 
salary VARCHAR(40), 
college_degrees VARCHAR(40)
);

INSERT INTO Professor(ssn_number, firstname, lastname, street_address, city,state,zip_code,area_code,telephone_number,sex,title,salary,college_degrees)
VALUES ('078-05-1125', 'Tom', 'Erichsen', '143 Fullerton Aveune', 'Stavanger','New jersey','12543', '815', '898-7898','M','Operating Systems Professor','$65000', 'BS in Computer Science');

INSERT INTO Professor(ssn_number, firstname, lastname, street_address, city,state,zip_code,area_code,telephone_number,sex,title,salary,college_degrees)
VALUES ('345-81-1360', 'Jessica', 'Gilbert', '809 Main Street', 'Stavanger','New jersey','92627', '815','773-5689','F','Calculus II Professor','$70000', 'PH D in Mathematics');

INSERT INTO Professor(ssn_number, firstname, lastname, street_address, city,state,zip_code,area_code,telephone_number,sex,title,salary,college_degrees)
VALUES ('726-09-5125', 'Katie', 'Brisk', '512 Belle Vue Cilmeri', 'Stavanger','New Jersey','82472', '815', '624-5125','F','Intro. to Java Professor','$55000', 'BS in Computer Science');

INSERT INTO Professor(ssn_number, firstname, lastname, street_address, city,state,zip_code,area_code,telephone_number,sex,title,salary,college_degrees)
VALUES ('100-23-7775', 'Aaron', 'Paul', '341 Woodland Place', 'Stavanger','New Jersey','86672', '815', '444-1111','M','Intro. to Political Science','$55000', 'MD in Political Science');

#=================================================================================================================Dept Table
CREATE TABLE Department(
dept_id VARCHAR(4) PRIMARY KEY, 
dept_name VARCHAR(30) NOT NULL, 
telephone VARCHAR(30) NOT NULL, 
office_location VARCHAR(50),
chair VARCHAR(30),
FOREIGN KEY (chair) REFERENCES Professor(ssn_number));

INSERT INTO Department(dept_id,dept_name,telephone, office_location,chair) 
VALUES ('CPSC','Computer Science','816-989-0987','203 Campus Street, Stravanger, NJ', '078-05-1125');

INSERT INTO Department(dept_id,dept_name,telephone, office_location,chair) 
VALUES ('MATH','Mathematics','816-421-2487','302 Campus Street, Stravanger, NJ', '345-81-1360');

INSERT INTO Department(dept_id,dept_name,telephone, office_location,chair) 
VALUES ('POSC','Political Science','816-555-9087','498 Campus Street, Stravanger, NJ', '100-23-7775');

#=================================================================================================================Course Table
CREATE TABLE Course(
course_id VARCHAR(50) NOT NULL PRIMARY KEY,
course_title VARCHAR(30) NOT NULL,
course_textbook VARCHAR(30) NOT NULL,
course_units INT(2),
dept_ID VARCHAR(4),
FOREIGN KEY (dept_ID) REFERENCES Department(dept_id));

INSERT INTO Course(course_id ,course_title,course_textbook ,course_units, dept_ID)
Values ('CPSC 315','Data Structures','Data Structure Concepts',4,'CPSC');

INSERT INTO Course(course_id ,course_title,course_textbook ,course_units, dept_ID)
Values ('CPSC 335','Data Base','Database Designs',4,'CPSC');

INSERT INTO Course(course_id ,course_title,course_textbook ,course_units, dept_ID)
Values ('Math 200','Calculus I','Single Variable Calculus',4,'MATH');

INSERT INTO Course(course_id ,course_title,course_textbook ,course_units, dept_ID)
Values ('Math 250','Calculus II','Calculus 8th Edition',4,'MATH');

#=================================================================================================================Student Table
CREATE TABLE Student(
student_cwid NUMERIC(9) NOT NULL PRIMARY KEY,
student_firstname VARCHAR(30) NOT NULL,
student_lastname VARCHAR(30)NOT NULL,
student_address VARCHAR(50) NOT NULL,
student_telephone VARCHAR(12) NOT NULL,
student_major VARCHAR(30) NOT NULL,
FOREIGN KEY (student_major) REFERENCES Department(dept_id)
);

INSERT INTO Student(student_cwid,student_firstname,student_lastname ,student_address,student_telephone, student_major)
Values (887991040,'Garinn','Morton','2024 Fullerton Aveune, Costa Mesa, CA, 92627','949-579-0297','CPSC');

INSERT INTO Student(student_cwid,student_firstname,student_lastname ,student_address,student_telephone, student_major)
Values (899941040,'Kenny','Giang','103 Grove Aveune, Garden Grove, CA, 72827','714-650-0211','CPSC');

INSERT INTO Student(student_cwid,student_firstname,student_lastname ,student_address,student_telephone, student_major)
Values (825091080,'Jessi','Prather','1222 Santa Ana Street, Long Island, NJ, 44556','605-210-0297','MATH');

INSERT INTO Student(student_cwid,student_firstname,student_lastname ,student_address,student_telephone, student_major)
Values (567901440,'Chris','Panella','872 54th Street, Newport Beach, CA, 92666','949-432-9052','CPSC');

INSERT INTO Student(student_cwid,student_firstname,student_lastname ,student_address,student_telephone, student_major)
Values (107942120,'Marina','Knutson','2024 Polaris Way, Biloxi, MS, 429311','405-992-6872','MATH');

INSERT INTO Student(student_cwid,student_firstname,student_lastname ,student_address,student_telephone, student_major)
Values (997441030,'Kai','Duty','123 Clemente Aveune, San Clemente, CA, 92486','715-200-0290','CPSC');

INSERT INTO Student(student_cwid,student_firstname,student_lastname ,student_address,student_telephone, student_major)
Values (187491040,'Jennifer','Sanchez','2024 River Street, Riverside, CA, 92607','909-444-0022','MATH');

INSERT INTO Student(student_cwid,student_firstname,student_lastname ,student_address,student_telephone, student_major)
Values (489391940,'Alex','Johnson','166 Apex Aveune, New York City, NY, 90345','876-904-8212','MATH');

#=================================================================================================================Section Table
CREATE TABLE Course_Sections(
course_section_number INT(6),
classroom VARCHAR(30) NOT NULL,
no_of_seats INT(2) NOT NULL,
meeting_days VARCHAR(50),
beginning_time VARCHAR(10),
ending_time VARCHAR(10),
prof_ssn VARCHAR(50),
course_id VARCHAR(50),
primary key (course_section_number, course_id),
FOREIGN KEY (course_id) REFERENCES Course(course_id),
FOREIGN KEY (prof_ssn) REFERENCES Professor(ssn_number)
);

Insert Into Course_Sections (course_section_number ,classroom ,no_of_seats ,meeting_days ,beginning_time ,ending_time, prof_ssn, course_id)
values (194000,'101A',30,'Monday and Wednesday','8:00 AM','9:15 AM', '078-05-1125', 'CPSC 315');

Insert Into Course_Sections (course_section_number ,classroom ,no_of_seats ,meeting_days ,beginning_time ,ending_time, prof_ssn, course_id)
values (194001,'103A',30,'Tuesday and Thursday','5:00 PM','6:15 PM', '078-05-1125', 'CPSC 315');

Insert Into Course_Sections (course_section_number ,classroom ,no_of_seats ,meeting_days ,beginning_time ,ending_time, prof_ssn, course_id)
values (194223,'201',30,'Monday','4:00 PM','6:30 PM', '345-81-1360', 'MATH 200');

Insert Into Course_Sections (course_section_number ,classroom ,no_of_seats ,meeting_days ,beginning_time ,ending_time, prof_ssn, course_id)
values (194222,'304',25,'Tuesday and Thursday','5:00 PM','6:15 PM', '345-81-1360', 'MATH 200');

Insert Into Course_Sections (course_section_number ,classroom ,no_of_seats ,meeting_days ,beginning_time ,ending_time, prof_ssn, course_id)
values (184021,'124',50,'Tuesday, Thursday, and Saturday','11:10 AM','12:25 PM', '726-09-5125', 'CPSC 335');

Insert Into Course_Sections (course_section_number ,classroom ,no_of_seats ,meeting_days ,beginning_time ,ending_time, prof_ssn, course_id)
values (184022,'409',30,'Monday, Wednesday, Friday','9:00 AM','10:15 AM', '726-09-5125', 'CPSC 335');

#=================================================================================================================enroll Table
CREATE TABLE enrollment_record(
student_cwid NUMERIC(9) NOT NULL,
course_section_number INT(6),
course_id varchar(50),
grade enum('A+', 'A', 'A-','B+', 'B', 'B-','C+', 'C', 'C-','D+', 'D', 'D-','F'),
primary key (student_cwid, course_section_number, course_id),
FOREIGN KEY (student_cwid) REFERENCES Student(student_cwid),
FOREIGN KEY (course_section_number) REFERENCES Course_Sections(course_section_number),
foreign key (course_id) references Course_Sections(course_id)
);

Insert Into enrollment_record
values (107942120,194000,'CPSC 315','A-');

Insert Into enrollment_record
values (107942120,194223,'MATH 200','A');

Insert Into enrollment_record 
values (107942120,184021,'CPSC 335','A+');

Insert Into enrollment_record 
values (887991040,194001,'CPSC 315','B');

Insert Into enrollment_record 
values (887991040,194223,'MATH 200','C+');

Insert Into enrollment_record 
values (887991040,184021,'CPSC 335','A+');

Insert Into enrollment_record 
values (899941040,194000,'CPSC 315','C-');

Insert Into enrollment_record 
values (899941040,194223,'MATH 200','A');

Insert Into enrollment_record 
values (899941040,184022,'CPSC 335','B+');

Insert Into enrollment_record 
values (825091080,194000,'CPSC 315','D-');

Insert Into enrollment_record 
values (825091080,194222,'MATH 200','F');

Insert Into enrollment_record 
values (825091080,184021,'CPSC 335','C');

Insert Into enrollment_record 
values (567901440,194000,'CPSC 315','B-');

Insert Into enrollment_record 
values (567901440,194223,'MATH 200','A');

Insert Into enrollment_record 
values (567901440,184021,'CPSC 335','A+');

Insert Into enrollment_record 
values (489391940,194000,'CPSC 315','A-');

Insert Into enrollment_record 
values (489391940,194223,'MATH 200','A');

Insert Into enrollment_record 
values (489391940,184021,'CPSC 335','A+');

Insert Into enrollment_record 
values (187491040,194000,'CPSC 315','A-');

Insert Into enrollment_record 
values (187491040,194223,'MATH 200','A');

#=================================================================================================================Minor Table
CREATE TABLE Minor(
student_cwid numeric(9),
dept_id VARCHAR(4),
primary key (student_cwid, dept_id),
foreign key (student_cwid) references Student(student_cwid),
foreign key (dept_id) references Department(dept_id)
);

INSERT INTO Minor
VALUES (887991040, 'MATH');

INSERT INTO Minor
VALUES (107942120, 'POSC');

INSERT INTO Minor
VALUES (899941040, 'MATH');

INSERT INTO Minor
VALUES (825091080, 'CPSC');

INSERT INTO Minor
VALUES (187491040, 'POSC');

#=================================================================================================================Prereq Table
CREATE TABLE Prerequisite(
course_id VARCHAR(50),
prereq_name VARCHAR(50),
primary key (course_id, prereq_name),
foreign key (course_id) references Course(course_id)
);

INSERT INTO Prerequisite
VALUES ('CPSC 315', 'CPSC 200');

INSERT INTO Prerequisite
VALUES ('CPSC 335', 'CPSC 315 OR CPSC 300');

INSERT INTO Prerequisite
VALUES ('MATH 200', 'MATH 150');

INSERT INTO Prerequisite
VALUES ('MATH 250', 'MATH 200');

#=================================================================================================================SQL Queries
#==================================================================================#1
SELECT c.course_title, s.classroom, s.meeting_days, s.beginning_time, s.ending_time
FROM Professor p, Course c, Course_Sections s
WHERE p.ssn_number = '078-05-1125' 
AND p.ssn_number = s.prof_ssn 
AND s.course_id = c.course_id;

#==================================================================================#2
SELECT E.grade, COUNT(grade) as 'NumberOf'
FROM enrollment_record E
WHERE E.course_section_number = 184021 and E.course_id='CPSC 335'
GROUP BY grade;

#==================================================================================#3
select c.course_section_number, c.classroom,meeting_days, c.beginning_time,c.ending_time, count(e.student_cwid)
from Course_Sections c
join enrollment_record e
on e.course_section_number = c.course_section_number and c.course_id='CPSC 315'
group by e.course_section_number;

#==================================================================================#4
select course_id, grade
from enrollment_record 
where student_cwid=899941040;

