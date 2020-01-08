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

