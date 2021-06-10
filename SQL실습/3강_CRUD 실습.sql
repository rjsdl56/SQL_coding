use world;
show tables;
desc city ;
select * from city where CountryCode ='KOR';
select * from city where Population > 5000000;
select count(*) from city where CountryCode = 'CHN';
select count(*) from city where CountryCode = 'JPN';
select count(*) from city where Population > 10000000;

insert into city values (10000, 'SampleCity', 'KOR', 'Test', 1000000);
insert into city values (20000, 'SampleCity2', 'KOR', 'Test', 2000000);

select * from city where id = 10000;
select * from city where id = 20000;

update city set Name='NewSampleCity' where id = 10000;
update city set Population=3000000 where id = 20000;
select * from city where id = 10000;
select * from city where id = 20000;

select * from city where id in (10000, 20000);
delete from city where id = 10000;
delete from city where id = 20000;
select * from city where id in (10000, 20000);

