use world;
select * from city where CountryCode in ('KOR', 'CHN', 'JPN');
select * from city where CountryCode != 'KOR' and Population >= 1000000;

# 실습
select distinct CountryCode from city where CountryCode = 'KOR';
select * from city where CountryCode='KOR' and Population > 5000000;
select count(*) from city where CountryCode in ('KOR', 'JPN', 'CHN');
select * from city where CountryCode ='KOR' and Population between 1000000 and 5000000;
select * from city where CountryCode ='KOR' and Population between 1000000 and 5000000 order by Name desc;
select * from city where CountryCode in ('KOR', 'JPN', 'CHN') and Population between 1000000 and 5000000 order by CountryCode, Population desc;

# limit (oracle은 rownum / top)
select * from city where CountryCode = "KOR" order by Population desc limit 5;
select count(*) from city where CountryCode = "KOR" order by Population;
select sum(Population) from city where CountryCode = "KOR";
select avg(Population) from city where CountryCode = "KOR";
select max(Population) from city where CountryCode = "KOR";
select * from city where Population = 9981619;

select Name, length(Name) from city where CountryCode = 'KOR';
select Name, length(Name), mid(Name,1,3) from city where CountryCode = 'KOR';
select Name, length(Name), upper(mid(Name,1,3)) from city where CountryCode = 'KOR';

desc country;
select * from country limit 10;
select Name, LifeExpectancy from country limit 10;
select Name, round(LifeExpectancy,0) from country limit 10;