use world;

# like
select * from city where CountryCode = 'KOR'; # 70
select count(*) from city where CountryCode like 'K%'; # 110;
select count(*) from city where CountryCode like '%K'; # k로 끝나는 국가 87개
select count(*) from city where CountryCode like '%K%'; # k가 들어간 국가 269개

select count(*) from city where CountryCode like 'K__'; # k로 시작하는 3자리 국가코드 110개
select count(*) from city where CountryCode like 'K_'; # k로 시작하는 2자리 국가코드 0개
select count(*) from city where CountryCode like 'K___'; # k로 시작하는 4자리 국가코드 0개
select count(*) from city ; # 전체 4079개
select count(*) from city where CountryCode like '___'; # 모든 국가는 3자리 코드

# null
select * from country where LifeExpectancy is null;
select count(*) from country where LifeExpectancy is null; # 17개
select count(*) from country where LifeExpectancy is not null; # 222개
select avg(LifeExpectancy) from country; # 기대수명 : 66.48604
select avg(ifnull(LifeExpectancy, 0)) from country ; # null을 0으로 바꾸었을 때 기대수명 : 61.75690
select CountryCode, count(CountryCode) from city group by CountryCode; # 각 나라별 도시 개수
select CountryCode, count(CountryCode) from city group by CountryCode having CountryCode = 'KOR'; # 한국 70개
select CountryCode, count(CountryCode) from city group by CountryCode having count(CountryCode) > 70 ; 

