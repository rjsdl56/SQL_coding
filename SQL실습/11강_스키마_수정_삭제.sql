# 스키마 수정
# 테이블 컬럼 추가 : alter table 테이블명 add 컬럼명 데이터타입
# 테이블 컬럼 삭제 : alter table 테이블명 drop column 컬럼명 
# 테이블 컬럼 삭제 : alter table 테이블명 change 컬럼명 새로운컬럼명 데이터타입
# 테이블 컬럼타입 수정 : alter table 테이블명 modify 컬럼명 데이터타입
# 기본키 제약조건 추가 : alter table 테이블명 add primary key 컬럼명
# 기본키 제약조건 삭제 : altr table 테이블명 drop primary key
# unique 제약조건 추가 : alter table 테이블명 add unique 컬럼명
# unique 제약조건 추가 : alter table 테이블명 add constraint 제약명 unique (컬럼명1, 컬렴명2) - 여러 개 컬럼에 유니크 제약
# unique 제약조건 삭제 : alter table 테이블명 drop unique 제약명
# 외래키 제약조건 추가 : alter table 테이블명 add foreign key (컬럼명) references 원테이블명(원컬럼명)
# 외래키 제약조건 삭제 : alter table 테이블명 drop foreign key 컬럼명
# 테이블명 변경 : alter table 테이블명 rename 새로운 테이블명 
# check 제약조건 추가 : alter table 테이블명 add check 조건
# check 여러 제약조건 추가 : alter table 테이블명 add constraint 조건명 check 조건
# check 제약조건 삭제 : alter table 테이블명 drop check 조건명
# default 제약조건 추가 : alter table 테이블명 alter 컬럼명 set default 기본값
# default 제약조건 삭제 : alter table 테이블명 alter 컬럼명 drop default

# 스키마 삭제
# 데이터베이스 삭제 : drop database 데이터베이스명
# 내용과 테이블 전체 삭제 : drop table 테이블명
# 레코드를 하나씩 지움, 스키마 유지 : delete from 테이블명
# 테이블 내용만 지움, 스키마 유지 : truncate table 테이블명

drop database sampledb;
create database sampleDB;
use sampleDB;
create table BusinessCard (Name varchar(255), Address varchar(255), Telephone varchar(25));
desc BusinessCard;

# record add
insert into BusinessCard values('Bob', 'Seoul', '123-4567');
insert into BusinessCard values('Sam', 'Busan', '321-4567');
select * from BusinessCard;

# column add
alter table BusinessCard add column ID int;
desc BusinessCard;

# change column name
alter table BusinessCard change Address Address1 varchar(255);
desc BusinessCard;

# change datatype
alter table BusinessCard modify Address1 char(255);
desc BusinessCard;

# primary key 
alter table BusinessCard add primary key (ID); # 오류 -> 현재 전부 NULL값이기 때문
update BusinessCard set ID=1 where Name = 'Bob';
update BusinessCard set ID=2 where Name = 'Sam';
alter table BusinessCard add primary key (ID);
desc BusinessCard;

# unique 
alter table BusinessCard add unique (ID);
desc BusinessCard;

# default
alter table BusinessCard alter Address1 set default 'Seoul';
desc BusinessCard;

# table name change
alter table BusinessCard rename BusinessCards;
desc BusinessCards;

# schema delete
truncate table BusinessCards; # 내용 삭제
select * from BusinessCards;
desc BusinessCards; # 스키마 유지

# table drop
drop table BusinessCards;
desc BusinessCards; # 삭제됨

show databases;






























































