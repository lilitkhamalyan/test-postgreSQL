-- create schema
drop schema if exists library cascade;
create schema library; 

-- need this extension to generate uuid
create extension if not exists "uuid-ossp" with schema library;

-- create AUTHOR table
drop table if exists library.authors;
create table library.authors(
      id uuid primary key,
      first_name text not null,
      last_name text not null,
      pseudonyme text null
    );  

-- insert data in AUTHORS table
insert into library.authors (id, first_name, last_name, pseudonyme)
      values
        (library.uuid_generate_v4(), 'James', 'Smith', 'Jimmy'),
        (library.uuid_generate_v4(),'Victoria', 'Brown', null);

-- create BOOKS table
drop table if exists library.books;
create table library.books (
      id uuid not null,
     author_id uuid references library.authors(id),
      title text,
      date_published text,
     primary key (id)
    );

-- insert data in BOOKS table
insert into library.books (id, author_id,title, date_published)
      values
(library.uuid_generate_v4(),
  (SELECT id FROM library.authors WHERE first_name = 'Victoria' AND last_name = 'Brown'),
  'Flying Over Normandy',
  'May 19, 1978'
),
(library.uuid_generate_v4(),
  (SELECT id FROM library.authors WHERE first_name = 'James' AND last_name = 'Smith'),
  'Postgres for Dummies',
  'August 2, 1954'
),
(library.uuid_generate_v4(),
  (SELECT id FROM library.authors WHERE first_name = 'James' AND last_name = 'Smith'),
  'HTML 5 & CSS 3',
  'April 4, 2013'
),
(library.uuid_generate_v4(),
  (SELECT id FROM library.authors WHERE first_name = 'Victoria' AND last_name = 'Brown'),
  'The Battle of Saratoga',
  'September 24, 1972'
),
(library.uuid_generate_v4(),
  (SELECT id FROM library.authors WHERE first_name = 'James' AND last_name = 'Smith'),
  'Design Patterns',
  'August 2, 1997'
);





