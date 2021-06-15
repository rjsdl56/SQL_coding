# DCL : 권한 및 역할 설정 언어 (CRUD 권한 설정)
# GRANT 나 REVOKE로 나뉨
# 주로 DBA가 설정

# 권한 설정
# 로컬시스템 / 외부유저 등록 : create user 'sampleUser'@'localhost' identified by '비밀번호';
# 사용자 삭제 : drop user 사용자명@호스트;
# 반영하기 : flush privileges;
# localhost 접속 허용 : grant all on DB.* to sampleUser@localhost identified by '비밀번호';
# 로컬랜 접속 허용 : grant all on *.* to sampleUser@'192.168.0.%' identified by '비밀번호';
# 인터넷전체 접속 허용 : gratn all on DB.* to sampleUser@% identified by '비밀번호';
# localhost sampleUser에게 DB 검색/ 추가 권한 부여 : grant select, insert on DB.* to sampleUser@localhost identified by '비밀번호';
# localhost sampleUser에게 DB city 테이블 도시명 업데이트 권한 부여 : grant update(Name) on DB.city to sampleUser@localhost identified by '비밀번호';
# localhost sampleUser의 모든 권한 삭제 : revoke all on *.* from sampleUser@localhost;


# 역할 설정 (mysql 지원 x)
# 역할 생성 : create role 역할명;
# 역할에 대한 권한 설정 : grant crud on 테이블명 to 역할명;
# 사용자에게 역할 부여 : grant 역할 to 사용자명;


# mysql 원격접속 설정
# 사용자를 원격 사용자로 등록 : grant all privileges on db명.테이블명 to 사용자명@% indentified by '비밀번호'


show databases;

use mysql;
desc user;

# user, host columns
select User, Host from user;

# create local host user
create user 'sampleUser'@'localhost' identified by 'test'; # 사용자 추가
select User, Host from user;

# create global user
create user 'sampleUser'@'%' identified by 'test'; # 사용자 추가
select User, Host from user;

# samplueUser 권한 확인
show grants for 'sampleUser'@'localhost'; 
show grants for 'sampleUser'@'%';

# sampleUser 권한 부여
grant all on world.* to 'sampleUser'@'localhost'; # localhost로 접근하는 유저에게 CRUD 권한을 모두 부여
show grants for 'sampleUser'@'localhost'; # world db에 대해 모든 권한을 부여받음

grant select on world.city to 'sampleUser'@'%'; # global 유저에게 city테이블 조회 권한만 부여
show grants for 'sampleUser'@'%'; # world db에 대해 모든 권한을 부여받음

grant update(CountryCode) on world.city to 'sampleUser'@'%' identified by 'test' ; # global 유저에게 city 테이블의 CountryCode 수정 권한 부여
show grants for 'sampleUser'@'%'; # world db에 대해 모든 권한을 부여받음





