create table dogs (
  id integer,
  name varchar(255),
  breed varchar(255),
  weight double,
  created_at datetime,
  updated_at datetime
);

insert into dogs values (1, 'Rover', 'Lab', 25.0, '2012-06-06 00:00:00', '2012-06-06 00:00:00');
insert into dogs values (2, 'Rex', 'Retreiver', 35.0, '2012-06-07 00:00:00', '2012-06-07 00:00:00');

create table cats (
  id integer,
  name varchar(255),
  breed varchar(255),
  weight double,
  created_at datetime,
  updated_at datetime
);

insert into cats values (1, 'Garfield', 'Tabby', 25.0, '2012-06-06 00:00:00', '2012-06-06 00:00:00');
insert into cats values (2, 'Tiger', 'Persian', 35.0, '2012-06-07 00:00:00', '2012-06-07 00:00:00');
