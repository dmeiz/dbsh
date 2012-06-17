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
