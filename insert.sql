insert into Musician values (123,'Alice','North Ryde','0404123456');
insert into Musician values (987,'Bob','Circular Quay','0404654321');
insert into Musician values (124,'Charlie','Parramatta','0426802468');
insert into Musician values (125,'David','North Ryde','0404123000');

insert into Album values (1001,'Beat it','2017-01-01','cd',123);
insert into Album values (1002,'Purpose','2017-04-01','dvd',987);
insert into Album values (1003,'Run away','2016-01-01','cd',987);
insert into Album values (1004,'Summer of 69','2015-01-01','cd',124);

insert into Song values (2001,'A song','Composer 1','Author 1',1001);
insert into Song values (2002,'Some song','Composer 1','Author 2',1002);
insert into Song values (2003,'Other song','Composer 2','Author 1',1002);
insert into Song values (2004,'Another song','Composer 3','Author 2',1003);

insert into Instrument values (3001,'Violin','C-Sharp');
insert into Instrument values (3002, 'Piano', 'D-Minor');
insert into Instrument values (3003, 'Guitar', 'B-Flat');

insert into Perform values (123, 2001);
insert into Perform values (124, 2002);
insert into Perform values (123, 2003);
insert into Perform values (123, 2004);

insert into Play values (987, 3001, 10);
insert into Play values (987, 3003, 20);
insert into Play values (123, 3002, 2);
insert into Play values (124, 3001, 8);
