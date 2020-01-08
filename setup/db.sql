-- create schema
create schema school;
-- create STUDENT table
create table student (
      student_id serial primary key,
      student_name varchar (100) not null
    );
-- insert data in Student table
insert into student (student_name)
      values
        ('James Smith'),
        ('Victoria Brown');
-- create table course
create table course (
      course_id integer not null,
      student_id integer references student(student_id),
      course_name varchar(50),
      teacher_name varchar (100),
      primary key (course_id, student_id)
    );

