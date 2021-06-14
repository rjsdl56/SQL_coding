use world;


# 참조무결성 확인
desc city;
desc country;

# record add
insert into country(Name, Code) values ('ZZZ', 'ZZZ');
insert into city(Name, CountryCode) values ('YYY', 'ZZZ');

# 참조무결성 오류 (입력 순서)
insert into city(Name, CountryCode) values ('MMM', 'TTT'); # Foreign key에 입력하려면 먼저 primary key에 데이터가 있어야 함


# 참조무결성 오류 (삭제 순서)
delete from country where Code='ZZZ'; # Foreign key를 먼저 제거해야 삭제 가능

# 참조무결성 삭제 순서
delete from city where CountryCode = 'ZZZ';
delete from country where Code='ZZZ';


















