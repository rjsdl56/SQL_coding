use world;

# 그냥 join은 inner join과 동일
select count(*) from city join country on city.CountryCode = country.Code;
select count(*) from city inner join country on city.CountryCode = country.Code;

# left join = inner join과 일치 --> country 테이블의 Code 컬럼에 null인 값 존재하지 않음
select count(*) from city left join country on city.CountryCode = country.Code;

# right join = inner join과 일치 X --> city 테이블의 컬럼이 부족 / 7개
select count(*) from city right join country on city.CountryCode = country.Code;

# 확인 -> city.CountryCode 가 null인 것들
select country.Name from city right join country on city.CountryCode = country.Code where city.CountryCode is null;

# as
select country.Name as 도시 from city right join country on city.CountryCode = country.Code where city.CountryCode is null;

# view (임시테이블로 저장)
create view sampleView as select country.Name as 도시 from city right join country on city.CountryCode = country.Code where city.CountryCode is null;
select count(*) from sampleView;
select * from sampleView;

# drop
drop view sampleView;
select * from sampleView;