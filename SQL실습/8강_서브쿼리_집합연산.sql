use world;

# 서브쿼리 실습
select Code from country where Name = 'South Korea'; # KOR
select count(*) from city where CountryCode = (select Code from country where Name = 'South Korea'); # KOR인 건 70개

select avg(Population) from city where CountryCode = 'KOR'; # 557141.3286
select Name, Population from city where Population > (select avg(Population) from city where CountryCode = 'KOR');

# all any 실습
select Population from city where CountryCode = 'KOR';
select Name, Population from city where Population > ALL (select Population from city where CountryCode = 'KOR'); # MAX의 효과
select Name, Population from city where Population > ANY (select Population from city where CountryCode = 'KOR'); # MIN의 효과

# in
select CountryCode, count(CountryCode) from city group by CountryCode; # 나라별 도시 수
select CountryCode, count(CountryCode) from city where CountryCode in (select Code  from Country where Name in ('South Korea', 'China', 'Japan')) group by CountryCode;
 select Name, CountryCode, Population from city where (Name, CountryCode) in (select Name, CountryCode from city where Population > 5000000);
 
 # exists
select count(*) from city;
select count(*) from city where exists (select * from city where CountryCode = 'KOR'); # 4079
select count(*) from city where exists (select * from city where CountryCode = 'KKK'); # 0
select count(*) from city where not exists (select * from city where CountryCode = 'KKK'); # 4079

select * from city where CountryCode = 'KOR' union (select * from city where CountryCode = 'CHN');
(select CountryCode from city where CountryCode = 'KOR') union all (select CountryCode from city where CountryCode = 'CHN');







