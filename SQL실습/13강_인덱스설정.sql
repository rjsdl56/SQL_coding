# 검색 기능을 위한 인덱스
# 검색을 빠르게 하기 위한 인덱스 설정
# 조인 시에도 영향을 줌
# 기본키는 자동으로 인덱스 설정

# 인덱스 설정
# create index 인덱스명 on 테이블명(컬럼명)
# create index 인덱스명 on 테이블명(컬럼명1, 컬럼명2, ...)
# create unique index 인덱스명 on 테이블명(컬럼명)
# alter table 테이블명 drop index 인덱스명

# 인덱스 실습
use world;
show tables; # 테이블 확인

# 새로운 테이블 생성
create table BusinessCard (Name varchar(255), Address varchar(255), Telephone varchar(255));

# record add
insert into BusinessCard values('Bob', 'Seoul', '123-4567');
insert into BusinessCard values('Sam', 'Busan', '321-4567');

# 데이터 확인
select * from BusinessCard;

# 인덱스 확인
show create table BusinessCard; # 기본 컬럼 3개

# 이름 컬럼에 인덱스 달기
create index BusinessCard_Name_index on BusinessCard(Name);

# 인덱스 확인
show create table BusinessCard; # KEY `BusinessCard_Name_index` (`Name`)

# 인덱스 삭제
alter table BusinessCard drop index BusinessCard_Name_index;

# 인덱스 확인
show create table BusinessCard;


####################################################################################
# 받아온 데이터를 데이터베이스에 넣기

# 테이블 확인
show databases;
use employees;
show tables;

# 테이블 확인
desc employees;

# 레코드 확인
select * from employees limit 10;

# 전체 개수 확인
select count(*) from employees;

# 인덱스가 있는 컬럼 확인 / 0.07초
select * from employees where emp_no = 20000;

# 인덱스가 없는 컬럼 확인 / 2.26초
select * from employees where last_name='Matzke' and first_name='Jenwei';

# last_name, first_name을 결합해서 인덱스 달아보기
create index employees_index on employees(last_name, first_name);

# 동일한 쿼리 실행 / 0.02초
select * from employees where last_name='Matzke' and first_name='Jenwei';

# 인덱스 드랍
alter table employees drop index employees_index;

# 동일한 쿼리 실행 / 2.25초
select * from employees where last_name='Matzke' and first_name='Jenwei';

