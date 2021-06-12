
# DB 만들기
create database sampleDB;
show databases;
use sampleDB;

# 테이블 만들기
create table BusinessCard
(
	Name varchar(255),
    Address varchar(255),
    Telephone varchar(255)
);
show tables; # 테이블 확인
desc BusinessCard; # 테이블 확인
show create table BusinessCard; # 테이블 확인
drop table BusinessCard; # 테이블 드랍 
show tables; # 테이블 드랍 확인
drop database sampleDB; # 데이터베이스 드랍
show databases; # 데이터베이스 드랍 확인

create database sampleDB;
use sampleDB;
create table BusinessCard(
	Name varchar(255),
    Address varchar(255),
    Telephone varchar(255)
);

# 데이터 입력
insert into BusinessCard values ('Bob', 'Seoul', '123-4567');
insert into BusinessCard values ('Sample', 'Busan', '321-4567');

# 테이블 드랍
drop table BusinessCard;

# 데이터 확인
select * from BusinessCard;


# Not Null 제약조건
create table BusinessCard (
	Name varchar(255) not null, 
    Address varchar(255),
    Telephone varchar(255)
);

# 테이블 확인
desc BusinessCard;

# 데이터 입력
insert into BusinessCard values ('Bob', NULL, NULL);
insert into BusinessCard values (NULL, NULL, NULL); # 제약 조건 위배

# 테이블 드롭
drop table BusinessCard;

# 유니크 제약조건
create table BusinessCard(
	Name varchar(255) unique,
    Address varchar(255),
    Telephone varchar(255)
);

# 테이블 확인
desc BusinessCard;

# 데이터 입력
insert into BusinessCard values ('Bob', NULL, NULL);
insert into BusinessCard values ('Bob', NULL, NULL); # 유니크 조건 위배

# 테이블 드롭
drop table BusinessCard;

# primary key 제약조건
create table BusinessCard(
	Id int primary key,
	Name varchar(255),
    Address varchar(255),
    Telephone varchar(255)
);
desc BusinessCard;

# 레코드(데이터) 넣기
insert into BusinessCard values (1, null, null, null);
insert into BusinessCard values (null, null, null, null); # primary key 제약조건 위배


# foreign key 제약조건
create table Salary(
	Id int not null,
	salary_amount int,
    business_card_id int not null,
    foreign key(business_card_id) references BusinessCard(id)
);

# 테이블 확인
desc Salary;

insert into Salary values (1,1000,1);
insert into Salary values (2,2000,2); # BusinessCard 테이블에 2번 아이디가 없음 -> 에러

# foreign key 참조 시 참조무결성 확인
delete from BusinessCard where id=1; # Salary에서 foreign key로 참조하기 때문에 지울 수 없음

# 삭제하고 싶으면 Salary에서 먼저 삭제해야 함
delete from Salary where id = 1;
delete from BusinessCard where id=1;

# check 제약 조건 확인
create table sample (Name varchar(255), Age int, check(Age > 0));
desc sample;
insert into sample values(1, -1); # check 제약조건 위배


# 테이블 드랍
drop table Salary;
drop table BusinessCard;

# default 제약조건 확인
create table BusinessCard(
	Name varchar(255),
    Address varchar(255) default 'Seoul'
);
desc BusinessCard;

# 레코드 넣기
insert into BusinessCard(Name) values ('Bob'); # Name 컬럼만 레코드 넣기

# 레코드 확인
select * from BusinessCard;

# 테이블 드롭
drop table BusinessCard;

# Autoincrement 제약조건
create table BusinessCard 
( id int auto_increment, Name varchar(255), primary key(id));

# 테이블 확인
desc BusinessCard;

# 레코드 넣기
insert into BusinessCard(Name) values ('Bob');
insert into BusinessCard(Name) values ('Sam');

# 레코드 확인
select * from BusinessCard; # id가 자동으로 오름차순
